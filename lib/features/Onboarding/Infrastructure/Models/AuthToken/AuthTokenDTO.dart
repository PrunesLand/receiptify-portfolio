import 'package:freezed_annotation/freezed_annotation.dart';

part 'AuthTokenDTO.freezed.dart';
part 'AuthTokenDTO.g.dart';

@freezed
class AuthTokenDTO with _$AuthTokenDTO {
  const factory AuthTokenDTO({
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _AuthTokenDTO;

  factory AuthTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDTOFromJson(json);
}
