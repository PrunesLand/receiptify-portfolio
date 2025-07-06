import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/image_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<ImageModel?> list,
  }) = _HomeState;
}
