import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserProfileDTO.freezed.dart';
part 'UserProfileDTO.g.dart';

@freezed
class UserProfileDTO with _$UserProfileDTO {
  const factory UserProfileDTO({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _UserProfileDTO;

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDTOFromJson(json);
}
