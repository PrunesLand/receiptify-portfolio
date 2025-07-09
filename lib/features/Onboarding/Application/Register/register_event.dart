import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.registerUser() = _RegisterUser;
  const factory RegisterEvent.isLoading() = _IsLoading;
}
