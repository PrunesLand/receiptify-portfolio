import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';

part 'ReceiptModel.freezed.dart';

@freezed
class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    @Default('') String id,
    DateTime? receiptDate,
    @Default('') String cost,
    File? file,
    @Default(ExpenseEnum.others) ExpenseEnum category,
  }) = _ReceiptModel;
}
