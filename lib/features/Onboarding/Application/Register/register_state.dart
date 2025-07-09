import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Domain/Models/RegisterUserModel.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    RegisterUserModel? user,
  }) = _RegisterState;
}
