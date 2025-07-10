import 'package:receipt_app/features/Onboarding/index.dart';

class UserRepository implements IUserRepository {
  final UserRepositoryService _userRepositoryService;

  UserRepository(this._userRepositoryService);

  @override
  Future<UserProfileDTO> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser({required RegisterUserModel user}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
