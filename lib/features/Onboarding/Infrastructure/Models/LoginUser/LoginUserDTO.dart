import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginUserDTO.freezed.dart';
part 'LoginUserDTO.g.dart';

@freezed
class LoginUserDTO with _$LoginUserDTO {
  const factory LoginUserDTO({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _LoginUserDTO;

  factory LoginUserDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDTOFromJson(json);
}
