import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/api_services/auth_api_service.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_request.dart';
import 'package:gene_tree_app/data/models/auth/response/refesh_token_response.dart';
import 'package:gene_tree_app/data/repositories/base_repository.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthApiService authApiService = Modular.get();
  @override
  Future<BaseResponse<LoginGoogleResponse>> loginGoogle(
    LoginGoogleRequest body, {
    OnExecuteDone<BaseResponse<LoginGoogleResponse>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  }) async {
    return execute<BaseResponse<LoginGoogleResponse>>(
      request: () => authApiService.loginWithGoogle(body),
      onExecuteDone: onExecuteDone,
      onExecuteError: onExecuteError,
      showLoading: true,
    );
  }

  @override
  Future<BaseResponse<RefreshTokenResponse>> refreshToken(
    RefreshTokenRequest data, {
    OnExecuteDone<BaseResponse<RefreshTokenResponse>>? onExecuteDone,
    OnExecuteError? onExecuteError,
  }) async {
    return execute<BaseResponse<RefreshTokenResponse>>(
      request: () => authApiService.refreshToken(data),
      onExecuteDone: onExecuteDone,
      onExecuteError: onExecuteError,
      showLoading: true,
    );
  }
}
