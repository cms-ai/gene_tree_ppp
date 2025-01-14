// ignore: constant_identifier_names
enum GenderEnum { MALE, FEMALE, OTHER }

enum SharePreferenceKeys {
  /// Sử dụng cho ThemeData bao gôm các theme như: light theme, dark theme
  currentTheme,

  /// Check xem user đã login lần đầu tiên hay chưa
  /// <Boolean>
  firstLogin,

  /// Token của user với type <String>
  token,

  /// Refresh token của user với type <String>
  refreshToken,
  //// User id với type <String>
  userId,
}

extension GenderEnumExt on GenderEnum {
  String enumToString() {
    return name;
  }
}
