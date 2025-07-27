import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/models/Image/ImageModel.dart';
import '../../domain/repository/IDocumentRepository.dart';
import '../Models/Document/DocumentDTO.dart';
import '../Service/DocumentRepositoryService.dart';

class DocumentRepository implements IDocumentRepository {
  final DocumentRepositoryService _documentRepositoryService;

  DocumentRepository(this._documentRepositoryService);

  @override
  Future<void> uploadDocument(ImageModel imageModel) async {
    try {
      final documentDTO = DocumentDTO(
        id: imageModel.id,
        content: imageModel.content,
        file: imageModel.file ?? File(''),
      );
      await _documentRepositoryService.uploadDocument(documentDTO);
    } on DioException {
      throw Exception("Failed to upload document");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
