import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _UserModel;
}
