import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/network/interceptor/app_interceptor.dart';
import 'package:gene_tree_app/core/network/interceptor/exports.dart';

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
        AuthInterceptor(
          _dio,
          Modular.get(),
        ),
        LoggingInterceptor(),
        AppInterceptor(),
      ],
    );
  }

  Dio get dio => _dio;
}
