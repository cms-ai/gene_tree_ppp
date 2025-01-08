import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/network/interceptor/app_interceptor.dart';
import 'package:gene_tree_app/core/network/interceptor/auth_interceptor.dart';
import 'package:gene_tree_app/core/network/interceptor/logging_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL),
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        )) {
    _dio.interceptors.addAll(
      [
        AuthInterceptor(_dio),
        LoggingInterceptor(),
        AppInterceptor(),
      ],
    );
  }

  Dio get dio => _dio;
}
