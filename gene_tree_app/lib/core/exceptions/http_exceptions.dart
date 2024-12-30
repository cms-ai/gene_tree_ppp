import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

extension HttpExceptions on DioException {
  Future<void> showDefaultError() async {
    final errorCode = response?.data['errorCode'] ?? "";
    EasyLoading.showError(errorCode.toString());
  }
}
