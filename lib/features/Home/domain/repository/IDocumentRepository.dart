import 'package:receipt_app/features/Home/domain/Model/Image/image_model.dart';

abstract class IDocumentRepository {
  Future<void> uploadDocument(ImageModel imageModel);
}
