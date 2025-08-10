import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Onboarding/Domain/Models/LoginUserModel.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.isLoading() = _IsLoading;
  const factory LoginEvent.loginUser(LoginUserModel user) = _LoginUser;
}
