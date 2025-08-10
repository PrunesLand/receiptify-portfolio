import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    String? email,
    String? password,
    String? repeatPassword,
    @Default(false) bool registrationFailed,
    @Default(false) bool finishRegister,
  }) = _RegisterState;
}
