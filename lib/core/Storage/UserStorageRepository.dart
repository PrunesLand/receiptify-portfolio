import 'package:isar/isar.dart';

import '../Schema/User.dart';
// Import your User model (e.g., user.dart)
// import 'path_to_your_model/user.dart'; // Assuming User class is defined here

class UserStorageRepository {
  final Isar isar;

  static const int _singleUserId = 1;

  UserStorageRepository(this.isar);

  // --- Create ---
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

  // Future<void> create

  // Future<List<int>> createMultipleUsers(List<User> users) async {
  //   return await isar.writeTxn(() async {
  //     return await isar.users.putAll(users);
  //   });
  // }

  // --- Read ---
  Future<User?> getUserById(int id) async {
    return await isar.users.get(id);
  }

  // Future<List<User>> getAllUsers() async {
  //   return await isar.users.where().findAll();
  // }

  Future<User?> findFirstUserByName(String name) async {
    return await isar.users.filter().nameEqualTo(name).findFirst();
  }

  // You can add more complex query methods here
  // For example, using sorted queries, distinct values, etc.
  Future<List<User>> getUsersSortedByName() async {
    return await isar.users.where().sortByName().findAll();
  }

  // --- Update ---
  // Isar's `put` operation handles both create and update.
  // If an object with the same ID exists, it's updated. Otherwise, it's created.
  Future<int> updateUser(User user) async {
    // Ensure the user object has an existing ID if you intend to update
    if (user.id == Isar.autoIncrement || user.id == null) {
      // Or however you handle new IDs vs existing IDs
      throw ArgumentError('User must have a valid ID to be updated.');
    }
    return await isar.writeTxn(() async {
      return await isar.users.put(user);
    });
  }

  // --- Delete ---
  Future<bool> deleteUserById(int id) async {
    return await isar.writeTxn(() async {
      return await isar.users.delete(id);
    });
  }

  Future<int> deleteMultipleUsersByIds(List<int> ids) async {
    return await isar.writeTxn(() async {
      return await isar.users.deleteAll(ids);
    });
  }

  Future<int> clearAllUsers() async {
    return await isar.writeTxn(() async {
      return await isar.users.where().deleteAll();
    });
  }

  // --- Watchers (for reactive updates) ---
  Stream<void> watchUsers() {
    return isar.users.watchLazy();
  }

  Stream<User?> watchUser(int id) {
    return isar.users.watchObject(id);
  }
}
