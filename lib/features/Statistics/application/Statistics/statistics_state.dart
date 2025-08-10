import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';

import '../../../Document/domain/Enums/Enums.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(false) bool isLoading,
    @Default([]) List<ReceiptModel> dataList,
    @Default({}) Map<ExpenseEnum, int> categoryCounts,
    @Default(ExpenseEnum.others) ExpenseEnum mostFrequentCategory,
    @Default(0) int mostFrequentCategoryQuantity,
  }) = _StatisticsState;
}
