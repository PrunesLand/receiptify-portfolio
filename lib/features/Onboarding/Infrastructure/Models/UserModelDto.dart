import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModelDto.freezed.dart';
part 'UserModelDto.g.dart';

@freezed
class UserModelDto with _$UserModelDto {
  const factory UserModelDto({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);
}
