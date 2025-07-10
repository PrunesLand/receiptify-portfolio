import 'package:freezed_annotation/freezed_annotation.dart';

part 'RegisterUserDTO.freezed.dart';
part 'RegisterUserDTO.g.dart';

@freezed
class RegisterUserDTO with _$RegisterUserDTO {
  const factory RegisterUserDTO({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterUserDTO;

  factory RegisterUserDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDTOFromJson(json);
}
