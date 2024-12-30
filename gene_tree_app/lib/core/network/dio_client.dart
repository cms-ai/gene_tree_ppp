import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gene_tree_app/core/network/interceptor/app_interceptor.dart';
import 'package:gene_tree_app/core/network/interceptor/auth_interceptor.dart';
import 'package:gene_tree_app/core/network/interceptor/logging_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL'] ?? "", // API Base URL
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        )) {
    _dio.interceptors.addAll(
      [
        AuthInterceptor(),
        LoggingInterceptor(),
        AppInterceptor(),
      ],
    );
  }

  Dio get dio => _dio;
}
