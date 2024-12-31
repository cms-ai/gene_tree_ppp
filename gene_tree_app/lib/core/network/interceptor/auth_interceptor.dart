import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SharePreferenceKeys.token.getData<String>() ?? "";
    print("======= ${token}");
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.headers['Authorization'] = '';
    }
    handler.next(options);
  }
}
