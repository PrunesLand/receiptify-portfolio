import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';
import 'package:receipt_app/features/Document/domain/models/Receipt/index.dart';
import 'package:receipt_app/features/Statistics/index.dart';

List<CategoryCount> getCategoryCounts(List<ReceiptModel?> expenses) {
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
  return categoryCounts.entries
      .map((entry) => CategoryCount(category: entry.key, count: entry.value))
      .toList();
}

MapEntry<ExpenseEnum, int> getMostFrequentCategory(
  List<CategoryCount> categoryCounts,
) {
  if (categoryCounts.isEmpty) {
    return MapEntry(ExpenseEnum.values.first, 0);
  }
  ExpenseEnum mostFrequent = ExpenseEnum.values.first;
  int maxCount = 0;
  for (var categoryCount in categoryCounts) {
    if (categoryCount.count > maxCount) {
      maxCount = categoryCount.count;
      mostFrequent = categoryCount.category;
    }
  }
  return MapEntry(mostFrequent, maxCount);
}
