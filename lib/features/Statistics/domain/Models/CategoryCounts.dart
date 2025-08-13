import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Document/domain/Enums/Enums.dart';

part 'CategoryCounts.freezed.dart';

@freezed
class CategoryCount with _$CategoryCount {
  const factory CategoryCount({
    required ExpenseEnum category,
    required int count,
  }) = _CategoryCount;
}
