import 'package:dio/dio.dart';
import 'package:gene_tree_app/api/user/models/request/user_request.dart';
import 'package:gene_tree_app/api/user/models/response/user_response.dart';
import '../core/dio_client.dart';
import '../core/base_response.dart';

class UserServices {
  final Dio _dio = DioClient().dio;
  Future<BaseResponse<UserResponse>> get(UserRequestImpl data) async {
    try {
      final response = await _dio.get('/user', data: data.toJson());
      return BaseResponse<UserResponse>.fromJson(
        response.data,
        (json) => UserResponse.fromJson(json),
      );
    } catch (e) {
      // Xử lý lỗi
      throw Exception('Failed to login: $e');
    }
  }
}