import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/clan/create_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';

abstract class ClanRepository {
  Future<BaseResponse<ClanEntity>> createClan(CreateClanRequest body);
  Future<BaseResponse<List<ClanEntity>>> getAllClanById(String userId);
}