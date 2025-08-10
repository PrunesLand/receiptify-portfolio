import 'package:receipt_app/features/Onboarding/index.dart';

extension UserModelMapper on UserProfileDTO {
  UserModel toDomain() {
    return UserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}

extension RegisterUserModelMapper on RegisterUserModel {
  RegisterUserDTO toDTO() {
    return RegisterUserDTO(
      id: id,
      firstName: '',
      lastName: '',
      email: email,
      password: password,
    );
  }
}
