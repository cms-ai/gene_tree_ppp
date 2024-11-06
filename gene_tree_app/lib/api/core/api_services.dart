import 'package:dio/dio.dart';
import 'package:gene_tree_app/api/core/base_response.dart';
import 'dio_client.dart';

class ApiService<T> {
  final Dio _dio = DioClient().dio;

  Future<BaseResponse> getRequest(String url) async {
    try {
      final response = await _dio.get(url);
      return BaseResponse.fromJson(
        response.data,
        (json) => response.data.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  // Hàm gửi POST request
  Future<BaseResponse> postRequest(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return BaseResponse.fromJson(
        response.data,
        (json) => response.data.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  // Hàm gửi PUT request
  Future<BaseResponse> putRequest(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return BaseResponse.fromJson(
        response.data,
        (json) => response.data.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to put data: $e');
    }
  }
}
