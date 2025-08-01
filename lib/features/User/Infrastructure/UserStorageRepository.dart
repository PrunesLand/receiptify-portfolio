import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';
import 'package:receipt_app/features/User/Domain/index.dart';

class UserStorageRepository implements IUserStorageRepository {
  final Isar isar;
  final Logger _logger;

  static const int _singleUserId = 1;

  UserStorageRepository(this.isar, this._logger);

  Future<User> getOrCreateUser() async {
    User? user = await isar.users.get(_singleUserId);
    if (user == null) {
      _logger.i(
        "Single user not found. Creating a new one with ID: $_singleUserId",
      );
      user = User(id: _singleUserId, title: "Default User");

      await isar.writeTxn(() async {
        await isar.users.put(user!);
      });
    }
    return user;
  }

  Future<void> addDocumentToMainPocket({
    Uint8List? imageBytes,
    required String fileName,
    required String totalExpense,
    DateTime? dateOfReceipt,
  }) async {
    try {
      await isar.writeTxn(() async {
        final user = await isar.users.get(_singleUserId);
        if (user == null) {
          throw Exception("Single user not found.");
        }

        final doc =
            Document()
              ..fileName = fileName
              ..totalExpense = totalExpense;

        if (imageBytes != null) {
          doc.image = imageBytes;
        }
        if (dateOfReceipt != null) {
          doc.dateOfReceipt = dateOfReceipt;
        }

        final updatedExpenses = List<Document>.from(user.mainPocket.expenses);

        updatedExpenses.add(doc);

        user.mainPocket.expenses = updatedExpenses;

        await isar.users.put(user);
        _logger.i(
          "Document '$fileName' added to MainPocket for user $_singleUserId.",
        ); // Good for logging
      });
    } catch (e) {
      _logger.e("Error adding document to MainPocket", error: e.toString());
    }
  }

  Future<void> deleteDocumentFromMainPocketByFileName(String fileName) async {
    await isar.writeTxn(() async {
      final user = await isar.users.get(_singleUserId);
      if (user == null) {
        throw Exception("Single user not found.");
      }

      int initialLength = user.mainPocket.expenses.length;
      user.mainPocket.expenses.removeWhere((doc) => doc.fileName == fileName);

      if (user.mainPocket.expenses.length < initialLength) {
        await isar.users.put(user);
        _logger.i(
          "Document with fileName '$fileName' removed from MainPocket for user $_singleUserId.",
        );
      } else {
        _logger.e(
          "Document with fileName '$fileName' not found in MainPocket for user $_singleUserId.",
        );
      }
    });
  }

  Future<void> addSubPocket(SubPocket newSubPocketData) async {
    await isar.writeTxn(() async {
      // 1. Fetch the single user using the fixed ID
      final user = await isar.users.get(_singleUserId);

      if (user == null) {
        // This case should ideally be handled by an initial setup
        // or the getOrCreateUser() method being called first.
        throw Exception("Single user not found. Ensure user is created first.");
      }

      // 2. Add the new SubPocket to the user's list
      user.subPocket.add(newSubPocketData);

      // 3. Save the updated user object
      await isar.users.put(user);
    });
  }

  Future<List<SubPocket?>> getAllSubPockets() async {
    final user = await isar.users.get(_singleUserId);
    return user?.subPocket ?? [];
  }

  Future<void> updateSubPocket(
    int index,
    SubPocket updatedSubPocketData,
  ) async {
    if (index < 0) throw ArgumentError("Index cannot be negative.");

    await isar.writeTxn(() async {
      final user = await isar.users.get(_singleUserId);
      if (user == null) {
        throw Exception("Single user not found.");
      }
      if (index >= user.subPocket.length) {
        throw RangeError("Index out of bounds for subPockets.");
      }
      user.subPocket[index] =
          updatedSubPocketData; // Replace the SubPocket at the given index
      await isar.users.put(user);
    });
  }

  Future<void> deleteSubPocket(int index) async {
    if (index < 0) throw ArgumentError("Index cannot be negative.");

    await isar.writeTxn(() async {
      final user = await isar.users.get(_singleUserId);
      if (user == null) {
        throw Exception("Single user not found.");
      }
      if (index >= user.subPocket.length) {
        throw RangeError("Index out of bounds for subPockets.");
      }
      user.subPocket.removeAt(index);
      await isar.users.put(user);
    });
  }

  @override
  Future<List<ReceiptModel?>> getAllDocumentsFromMainPockets() async {
    try {
      final user = await isar.users.get(_singleUserId);
      if (user == null) {
        _logger.w(
          "User not found when trying to get documents from main pocket.",
        );
        return [];
      }
      final documents = user.mainPocket.expenses;
      final newList = mapDocumentsToImageModels(documents);
      return newList;
    } catch (e) {
      _logger.e(
        "Error getting documents from main pocket",
        error: e.toString(),
      );
      return [];
    }
  }
}
