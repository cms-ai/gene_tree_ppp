import 'dart:convert';

class JWTHelper {
  /// Decode a JWT and return its payload as a Map.
  static Map<String, dynamic>? decode(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception("Invalid JWT format");
      }
      final payload = base64Url.normalize(parts[1]);
      final decoded = utf8.decode(base64Url.decode(payload));
      return jsonDecode(decoded);
    } catch (e) {
      return null;
    }
  }

  /// Get expiration date from a JWT.
  static DateTime? getExpiration(String token) {
    final payload = decode(token);
    if (payload != null && payload.containsKey('exp')) {
      final exp = payload['exp'] as int;
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    }
    return null;
  }

  /// Check if the JWT is valid (not expired).
  static bool isValid(String token) {
    final expiration = getExpiration(token);
    if (expiration != null) {
      return DateTime.now().isBefore(expiration);
    }
    return false;
  }
}
