import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicStats.freezed.dart';

@freezed
class BasicStats with _$BasicStats {
  const factory BasicStats({
    @Default('') String totalExpense,
    @Default('') String dateOfLastExpense,
    @Default('') String remainingBudget,
  }) = _BasicStats;
}
