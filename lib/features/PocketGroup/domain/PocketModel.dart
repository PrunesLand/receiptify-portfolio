import 'package:freezed_annotation/freezed_annotation.dart';

part 'PocketModel.freezed.dart';

@freezed
class PocketModel with _$PocketModel {
  const factory PocketModel({
    String? id,
    required String title,
    required String totalExpense,
    required String totalBudget,
  }) = _PocketModel;
}
