import 'package:receipt_app/features/Onboarding/index.dart';

abstract class IUserRepository {
  Future<void> registerUser({required RegisterUserModel user});
  Future<UserModel> getProfile();
  Future<void> login({required String email, required String password});
}
