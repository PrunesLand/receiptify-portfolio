import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReceiptModel.freezed.dart';

@freezed
class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    @Default('') String id,
    DateTime? receiptDate,
    @Default('') String cost,
    File? file,
  }) = _ReceiptModel;
}
