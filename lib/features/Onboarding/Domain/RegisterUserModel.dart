import 'package:freezed_annotation/freezed_annotation.dart';

part 'RegisterUserModel.freezed.dart';

@freezed
class RegisterUserModel with _$RegisterUserModel {
  const factory RegisterUserModel({
    @Default('') String id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
  }) = _RegisterUserModel;
}
