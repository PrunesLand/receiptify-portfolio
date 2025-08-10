import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_app/features/Onboarding/Domain/index.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.emailChanged(String email) = _EmailChanged;
  const factory RegisterEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory RegisterEvent.isLoading() = _IsLoading;
  const factory RegisterEvent.register(RegisterUserModel user) = _Register;
}
