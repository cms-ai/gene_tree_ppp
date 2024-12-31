import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';

class GetUserUsecase {
  final AuthRepository _authRepository;

  GetUserUsecase(this._authRepository);

  Future<LoginGoogleResponse?> call(LoginGoogleRequest data) async {
    final result = await _authRepository.loginGoogle(data)..data;
    return result.data;
  } 
}
