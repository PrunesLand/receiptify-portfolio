import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicStats.freezed.dart';

@freezed
class BasicStats with _$BasicStats {
  const factory BasicStats({
    required String totalExpense,
    required String dateOfLastExpense,
    required String remainingBudget,
  }) = _BasicStats;
}
