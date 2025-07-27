import '../models/Image/ImageModel.dart';

abstract class IDocumentRepository {
  Future<void> uploadDocument(ImageModel imageModel);
}
