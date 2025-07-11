import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicStatsDTO.freezed.dart';
part 'BasicStatsDTO.g.dart';

@freezed
class BasicStatsDTO with _$BasicStatsDTO {
  const factory BasicStatsDTO({
    @JsonKey(name: 'total_expense') required String totalExpense,
    @JsonKey(name: 'date_last_expense') required String dateOfLastExpense,
    @JsonKey(name: 'remaining_budget') required String remainingBudget,
  }) = _BasicStatsDTO;

  factory BasicStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$BasicStatsDTOFromJson(json);
}
