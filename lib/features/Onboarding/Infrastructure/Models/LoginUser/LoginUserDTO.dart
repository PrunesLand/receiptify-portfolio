import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginUserDTO.freezed.dart';

@freezed
class LoginUserDTO with _$LoginUserDTO {
  const factory LoginUserDTO({
    required String email,
    required String password,
  }) = _LoginUserDTO;
}
