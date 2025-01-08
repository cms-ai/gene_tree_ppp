// lib/data/data_sources/auth/auth_api_service.dart
import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'clan_api_service.g.dart';

@RestApi()
abstract class ClanApiService {
  factory ClanApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ClanApiService;

  @POST("/clan/create")
  Future<BaseResponse<ClanEntity>> createClan(
    @Body() CreateClanRequest? body,
  );

  @GET("/clan/all")
  Future<BaseResponse<List<ClanEntity>>> getAllWithId(
    @Query("user_id") String userId,
  );
}
