import 'package:dio/dio.dart';
// import 'package:gene_tree_app/api/auth/models/request/auth_request.dart';
// import 'package:gene_tree_app/api/auth/models/response/auth_response.dart';
import '../core/dio_client.dart';
// import '../core/base_response.dart';

class AuthServices {
  final Dio _dio = DioClient().dio;
  ///
  /// This is template for service
  ///
  // Future<BaseResponse<AuthResponse>> login(AuthRequestImpl data) async {
  //   try {
  //     final response = await _dio.get('/auth/login', data: data.toJson());
  //     return BaseResponse<AuthResponse>.fromJson(
  //       response.data,
  //       (json) => AuthResponse.fromJson(json),
  //     );
  //   } catch (e) {
  //     // Xử lý lỗi
  //     throw Exception('Failed to login: $e');
  //   }
  // }
}