import 'package:flutter/foundation.dart';
import 'package:gene_tree_app/core/exceptions/http_exceptions.dart';

extension ErrorHelpers on ErrorResponse {
  String getDefaultError() {
    String errorText = message ?? "";
    if (kDebugMode) {
      errorText += "\n($errorCode";
    }
    return errorText;
  }
}
