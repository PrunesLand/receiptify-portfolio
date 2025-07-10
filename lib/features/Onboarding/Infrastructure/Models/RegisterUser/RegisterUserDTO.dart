import 'package:freezed_annotation/freezed_annotation.dart';

part 'RegisterUserDTO.freezed.dart';

@freezed
class RegisterUserDTO with _$RegisterUserDTO {
  const factory RegisterUserDTO({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterUserDTO;
}
