import 'dart:typed_data';

import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';

import 'Schema/User.dart';

abstract class IUserStorageRepository {
  Future<User> getOrCreateUser();
  Future<void> addDocumentToMainPocket({
    Uint8List? imageBytes,
    required String fileName,
    required String totalExpense,
    DateTime? dateOfReceipt,
  });
  Future<void> deleteDocumentFromMainPocketByFileName(String fileName);
  Future<void> addSubPocket(SubPocket newSubPocketData);
  Future<List<SubPocket?>> getAllSubPockets();
  Future<void> updateSubPocket(int index, SubPocket updatedSubPocketData);
  Future<void> deleteSubPocket(int index);
  Future<List<ReceiptModel?>> getAllDocumentsFromMainPockets();
}
