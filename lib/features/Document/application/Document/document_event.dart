import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/ReceiptModel.dart';

part 'document_event.freezed.dart';

@freezed
class DocumentEvent with _$DocumentEvent {
  const factory DocumentEvent.loading() = _Loading;
  const factory DocumentEvent.removeImage({required String id}) = _RemoveImage;
  const factory DocumentEvent.processImage({required File file}) =
      _ProcessImage;
  const factory DocumentEvent.loadSavedFiles() = _LoadSavedFiles;
  const factory DocumentEvent.addNewReceipt(ReceiptModel receipt) =
      _AddNewReceipt;
  const factory DocumentEvent.chipSelect(DocumentChipEnum value) = _ChipSelect;
}
