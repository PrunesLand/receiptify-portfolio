import 'dart:io';

import 'package:dio/dio.dart';
import 'package:receipt_app/features/Home/domain/index.dart';

import '../Models/Document/DocumentDTO.dart';
import '../Service/DocumentRepositoryService.dart';

class DocumentRepositoryImpl implements IDocumentRepository {
  final DocumentRepositoryService _documentRepositoryService;

  DocumentRepositoryImpl(this._documentRepositoryService);

  @override
  Future<void> uploadDocument(ImageModel imageModel) async {
    try {
      final documentDTO = DocumentDTO(
        id: imageModel.id,
        fileName: imageModel.fileName,
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
