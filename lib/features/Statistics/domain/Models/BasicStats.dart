import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../PocketGroup/domain/index.dart';

part 'BasicStats.freezed.dart';

@freezed
class BasicStats with _$BasicStats {
  const factory BasicStats({
    required PocketModel pocket,
    required String summaryExpense,
  }) = _BasicStats;
}
