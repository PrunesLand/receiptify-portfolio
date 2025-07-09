import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Onboarding/Domain/Models/LoginUserModel.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    LoginUserModel? user,
  }) = _LoginState;
}
