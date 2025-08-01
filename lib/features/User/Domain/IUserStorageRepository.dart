import 'dart:typed_data';

import '../../Document/domain/models/Image/ImageModel.dart';
import 'Schema/User.dart';

abstract class IUserStorageRepository {
  Future<User> getOrCreateUser();
  Future<void> addDocumentToMainPocket(
    Uint8List imageBytes,
    String fileName,
    String totalExpense,
  );
  Future<void> deleteDocumentFromMainPocketByFileName(String fileName);
  Future<void> addSubPocket(SubPocket newSubPocketData);
  Future<List<SubPocket?>> getAllSubPockets();
  Future<void> updateSubPocket(int index, SubPocket updatedSubPocketData);
  Future<void> deleteSubPocket(int index);
  Future<List<ImageModel?>> getAllDocumentsFromMainPockets();
}
