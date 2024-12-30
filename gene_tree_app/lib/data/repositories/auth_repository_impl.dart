import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/api_services/auth_api_service.dart';
import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService = Modular.get();
  @override
  Future<BaseResponse<LoginGoogleResponse>> loginGoogle(
      LoginGoogleRequest body) async {
    return await authApiService.loginWithGoogle(
      body: body,
      
    );
  }
}
