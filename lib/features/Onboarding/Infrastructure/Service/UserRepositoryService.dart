import 'package:dio/dio.dart';
import 'package:receipt_app/features/Onboarding/index.dart';
import 'package:retrofit/retrofit.dart';

part 'UserRepositoryService.g.dart';

@RestApi(baseUrl: "https://api.example.com")
abstract class UserRepositoryService {
  factory UserRepositoryService(Dio dio, {String baseUrl}) =
      _UserRepositoryService;

  @GET('/users/profile')
  Future<UserProfileDTO> getUserProfile();

  @POST("auth/login")
  Future<AuthTokenDTO> login(@Body() LoginUserDTO loginUser);
}
