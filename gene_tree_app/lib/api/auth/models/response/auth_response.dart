


import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

/// AUTO GENERATE PLEASE DON't MODIFY, 
/// you can remove id if it not nesscessary
@freezed
class AuthResponse  with _$AuthResponse {
  const factory AuthResponse({
    required String id,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
