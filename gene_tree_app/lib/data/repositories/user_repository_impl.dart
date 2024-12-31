import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/api_services/user_api_service.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService userApiService = Modular.get();

  @override
  Future<BaseResponse<UserEntity>> getUser(String userId) {
    return userApiService.getUser(userId);
  }

  @override
  Future<BaseResponse<UserEntity>> deleteUser(String userId) {
    return userApiService.updateUser(userId);
  }

  @override
  Future<BaseResponse<UserEntity>> updateUser(String userId) {
    return userApiService.deleteUser(userId);
  }
}
