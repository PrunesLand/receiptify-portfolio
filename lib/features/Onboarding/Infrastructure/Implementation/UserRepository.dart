import 'package:dio/dio.dart';
import 'package:receipt_app/features/Onboarding/index.dart';

import '../../../../core/Storage/TokenStorageService.dart';

class UserRepository implements IUserRepository {
  final UserRepositoryService _userRepositoryService;
  final TokenStorageService _tokenStorageService;

  UserRepository(this._userRepositoryService, this._tokenStorageService);

  @override
  Future<UserModel> getProfile() async {
    try {
      final response = await _userRepositoryService.getUserProfile();
      return response.toDomain();
    } on DioException {
      throw Exception("Failed to fetch user profile");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final loginData = LoginUserDTO(email: email, password: password);
      final AuthResponse = await _userRepositoryService.login(loginData);

      await _tokenStorageService.saveToken(AuthResponse.accessToken);
    } on DioException {
      throw Exception("Failed to login");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  @override
  Future<void> registerUser({required RegisterUserModel user}) async {
    try {
      final registerData = user.toDTO();
      await _userRepositoryService.registerUser(registerData);
    } on DioException {
      throw Exception("Failed to register user");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
