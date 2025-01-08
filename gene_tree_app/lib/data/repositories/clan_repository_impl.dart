import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/api_services/clan_api_service.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class ClannRepositoryImpl implements ClanRepository {
  final ClanApiService clanApiService = Modular.get();

  @override
  Future<BaseResponse<ClanEntity>> createClan(CreateClanRequest body) {
    return clanApiService.createClan(body);
  }

  @override
  Future<BaseResponse<List<ClanEntity>>> getAllClanById(String userId) {
    return clanApiService.getAllWithId(userId);
  }
}
