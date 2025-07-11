import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../Models/Document/DocumentDTO.dart';

part 'DocumentRepositoryService.g.dart';

@RestApi(baseUrl: "https://api.example.com")
abstract class DocumentRepositoryService {
  factory DocumentRepositoryService(Dio dio, {String baseUrl}) =
      _DocumentRepositoryService;

  @POST("/documents/upload")
  @MultiPart()
  Future<void> uploadDocument(@Body() DocumentDTO documentDTO);
}
