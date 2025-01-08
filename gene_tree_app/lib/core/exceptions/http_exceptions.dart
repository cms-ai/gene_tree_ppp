import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/core/utils/global_keys.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';

extension HttpExceptions on DioException {
  Future<void> showDefaultError() async {
    try {
      // final errorCode = response?.data['errorCode'] ?? "";
      if (response?.data != null) {
        // print("====== ${this}");
        final errorRes = ErrorResponse.fromJson(response?.data);
        CmDialogScreen(
          argument: CmDialogArgument(
            title: errorRes.errorCode,
            content: errorRes.message,
            type: CmDialogType.alert,
          ),
        ).show(
          GlobalKeys().navigatorKey.currentState!.context,
        );
      } else {
        CmDialogScreen(
          argument: CmDialogArgument(
            title: "Error",
            content: message,
            type: CmDialogType.alert,
          ),
        ).show(
          GlobalKeys().navigatorKey.currentState!.context,
        );
      }
    } catch (e) {
      LoggerUtil.errorLog("Error aitc: $e");
    }
  }
}

class ErrorResponse {
  final int? statusCode;
  final String? errorCode;
  final String? message;

  ErrorResponse({
    required this.statusCode,
    this.errorCode,
    this.message = 'An error occurred',
  });

  // Factory constructor để chuyển đổi từ JSON
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['statusCode'] ?? 400,
      errorCode: json['errorCode'],
      message: json['message'] ?? 'An error occurred',
    );
  }

  // Phương thức để chuyển đổi thành JSON (nếu cần)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'errorCode': errorCode,
      'message': message,
    };
  }
}
