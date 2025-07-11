import 'package:dio/dio.dart';
import 'package:receipt_app/features/Statistics/infrastructure/Models/BasicStatsDTO.dart';
import 'package:retrofit/retrofit.dart';

part 'StatisticsRepositoryService.g.dart';

@RestApi(baseUrl: "https://api.example.com")
abstract class StatisticsRepositoryService {
  factory StatisticsRepositoryService(Dio dio, {String baseUrl}) =
      _StatisticsRepositoryService;

  @GET('/stats/basicStats')
  Future<BasicStatsDTO> getBasicStats();
}
