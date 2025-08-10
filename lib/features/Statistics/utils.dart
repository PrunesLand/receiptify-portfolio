import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';

Map<ExpenseEnum, int> getCategoryCounts(List<ReceiptModel?> expenses) {
  Map<ExpenseEnum, int> categoryCounts = {};
  for (var category in ExpenseEnum.values) {
    categoryCounts[category] = 0;
  }
  for (var expense in expenses) {
    if (expense != null) {
      categoryCounts[expense.category] =
          (categoryCounts[expense.category] ?? 0) + 1;
    }
  }
  return categoryCounts;
}

MapEntry<ExpenseEnum, int> getMostFrequentCategory(
  Map<ExpenseEnum, int> categoryCounts,
) {
  ExpenseEnum mostFrequent = ExpenseEnum.values.first;
  int maxCount = 0;
  categoryCounts.forEach((category, count) {
    if (count > maxCount) {
      maxCount = count;
      mostFrequent = category;
    }
  });
  return MapEntry(mostFrequent, maxCount);
}
