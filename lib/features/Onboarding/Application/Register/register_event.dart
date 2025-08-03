import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.emailChanged(String email) = _EmailChanged;
  const factory RegisterEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory RegisterEvent.isLoading() = _IsLoading;
}
