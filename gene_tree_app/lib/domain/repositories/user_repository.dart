import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<BaseResponse<UserEntity>> getUser(
    String userId, {
    OnExecuteDone<BaseResponse<UserEntity>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  });
  Future<BaseResponse<UserEntity>> updateUser(
    String userId, {
    OnExecuteDone<BaseResponse<UserEntity>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  });
  Future<BaseResponse<UserEntity>> deleteUser(
    String userId, {
    OnExecuteDone<BaseResponse<UserEntity>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  });
}
