import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../Schema/User.dart';

// --- IMPORTANT ---
// 1. Import your user model file here.
//    This import gives you access to the generated 'UserSchema' object.
//    Make sure the path is correct for your project structure.

/// A singleton service class for managing the Isar database instance.
class UserStorageService {
  UserStorageService._privateConstructor();
  static final UserStorageService instance =
      UserStorageService._privateConstructor();

  late final Isar _db;
  bool _isInitialized = false;

  /// Getter to access the Isar database instance.
  Isar get db {
    if (!_isInitialized) {
      throw Exception(
        "IsarService has not been initialized. Call init() first.",
      );
    }
    return _db;
  }

  /// Initializes the Isar database with the hardcoded User schema.
  Future<void> init() async {
    if (_isInitialized) {
      debugPrint("IsarService is already initialized.");
      return;
    }

    try {
      final dir = await getApplicationDocumentsDirectory();
      _db = await Isar.open(
        [UserSchema], // <-- Corrected line
        directory: dir.path,
      );

      _isInitialized = true;
      debugPrint("IsarService initialized successfully with UserSchema.");
    } catch (e) {
      debugPrint("Error initializing IsarService: $e");
      rethrow;
    }
  }

  /// A convenience method to perform a write transaction.
  Future<T> writeTxn<T>(Future<T> Function(Isar isar) callback) async {
    return await db.writeTxn(() => callback(db));
  }

  /// Closes the Isar database.
  Future<void> close() async {
    if (_isInitialized) {
      await _db.close();
      _isInitialized = false;
      debugPrint("IsarService database closed.");
    }
  }
}
