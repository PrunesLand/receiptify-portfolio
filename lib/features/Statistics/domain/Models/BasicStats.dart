import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicStats.freezed.dart';

@freezed
class BasicStats with _$BasicStats {
  const factory BasicStats({
    required String title,
    required String totalExpense,
    required String remainingBudget,
    required String totalBudget,
  }) = _BasicStats;
}
