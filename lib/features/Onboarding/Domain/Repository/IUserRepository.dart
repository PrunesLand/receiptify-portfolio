import 'package:receipt_app/features/Onboarding/Domain/index.dart';

abstract class IUserRepository {
  Future<void> registerUser({required RegisterUserModel user});
  Future<bool> isUserRegistered({required LoginUserModel user});
}
