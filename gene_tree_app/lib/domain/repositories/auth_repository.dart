import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginGoogleResponse>> loginGoogle(
      LoginGoogleRequest data);
}
