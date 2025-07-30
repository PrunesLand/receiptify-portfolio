import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:receipt_app/core/index.dart';

// Import your User model (e.g., user.dart)
// import 'path_to_your_model/user.dart'; // Assuming User class is defined here

class UserStorageRepository implements IUserStorageRepository {
  final Isar isar;

  static const int _singleUserId = 1;

  UserStorageRepository(this.isar);

  Future<User> getOrCreateUser() async {
    User? user = await isar.users.get(_singleUserId);
    if (user == null) {
      print(
        "Single user not found. Creating a new one with ID: $_singleUserId",
      );
      user = User(id: _singleUserId, name: "Default User"); // Set the fixed ID
      // Initialize other default fields for User if necessary
      // user.mainPocket = MainPocket(); // Already initialized in your schema
      // user.subPocket = [];          // Already initialized in your schema
      await isar.writeTxn(() async {
        await isar.users.put(user!);
      });
    }
    return user;
  }

  Future<void> addDocumentToMainPocket(
    Uint8List imageBytes,
    String fileName,
    String totalExpense,
  ) async {
    try {
      await isar.writeTxn(() async {
        final user = await isar.users.get(_singleUserId);
        if (user == null) {
          throw Exception("Single user not found.");
        }

        final doc =
            Document()
              ..fileName = fileName
              ..totalExpense = totalExpense
              ..image = imageBytes;

        final updatedExpenses = List<Document>.from(user.mainPocket.expenses);

        updatedExpenses.add(doc);

        user.mainPocket.expenses = updatedExpenses;

        await isar.users.put(user);
        print(
          "Document '$fileName' added to MainPocket for user $_singleUserId.",
        ); // Good for logging
      });
    } catch (e) {
      print("Error adding document to MainPocket: $e");
    }
  }

  Future<void> deleteDocumentFromMainPocketByFileName(String fileName) async {
    bool removed = false;
    await isar.writeTxn(() async {
      final user = await isar.users.get(_singleUserId);
      if (user == null) {
        throw Exception("Single user not found.");
      }

      int initialLength = user.mainPocket.expenses.length;
      user.mainPocket.expenses.removeWhere((doc) => doc.fileName == fileName);

      if (user.mainPocket.expenses.length < initialLength) {
        await isar.users.put(user);
        removed = true;
        print(
          "Document with fileName '$fileName' removed from MainPocket for user $_singleUserId.",
        );
      } else {
        print(
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
}
