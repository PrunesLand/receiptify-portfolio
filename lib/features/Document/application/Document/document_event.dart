import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_event.freezed.dart';

@freezed
class DocumentEvent with _$DocumentEvent {
  const factory DocumentEvent.loading() = _Loading;
  const factory DocumentEvent.addImage({required File file}) = _AddImage;
  const factory DocumentEvent.removeImage({required String id}) = _RemoveImage;
  const factory DocumentEvent.processImage() = _ProcessImage;
  const factory DocumentEvent.updateTotalExpense() = _UpdateTotalExpense;
}
