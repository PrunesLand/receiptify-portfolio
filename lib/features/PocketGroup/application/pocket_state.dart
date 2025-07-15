import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/PocketModel.dart';

part 'pocket_state.freezed.dart';

@freezed
class PocketState with _$PocketState {
  const factory PocketState({
    @Default('') String id,
    @Default('') String title,
    @Default('') String totalExpense,
    @Default('') String totalBudget,
    @Default([]) List<PocketModel> pockets,
  }) = _PocketState;
}
