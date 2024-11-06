import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  late Dio _dio;

  // Singleton instance của DioClient
  static final DioClient _instance = DioClient._internal();

  // Constructor riêng tư ngăn tạo mới instance
  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.env["BASE_URL"] ?? "", // Thay bằng URL API của bạn
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Thêm Interceptors nếu cần
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Xử lý trước khi gửi request
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Xử lý sau khi nhận response
        return handler.next(response);
      },
      onError: (error, handler) {
        // Xử lý lỗi
        return handler.next(error);
      },
    ));
  }

  // Hàm public để truy cập Dio từ bên ngoài
  Dio get dio => _dio;

  // Factory để trả về Singleton instance
  factory DioClient() {
    return _instance;
  }
}
