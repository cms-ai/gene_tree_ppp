import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';

class GetUserUsecase {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);

  Future<UserEntity?> call(
    String userId, {
    OnExecuteDone<BaseResponse<UserEntity>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  }) async {
    final result = await _userRepository.getUser(
      userId,
      onExecuteError: onExecuteError,
      onExecuteDone: onExecuteDone,
    );
    return result.data;
  }
}
