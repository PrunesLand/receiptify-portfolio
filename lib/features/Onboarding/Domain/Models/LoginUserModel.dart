import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginUserModel.freezed.dart';

@freezed
class LoginUserModel with _$LoginUserModel {
  const factory LoginUserModel({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginUserModel;
}
