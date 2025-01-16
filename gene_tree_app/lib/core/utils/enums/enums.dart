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

  // clanId with type <String>

  clanId
}

// AsyncValue giúp dễ dàng quản lý loading, success và error cho từng phần dữ liệu.
enum AsyncStatus { loading, success, error }

class AsyncValue<T> {
  final AsyncStatus status;
  final T? data;
  final String? error;

  const AsyncValue._(this.status, this.data, this.error);

  const AsyncValue.loading() : this._(AsyncStatus.loading, null, null);
  const AsyncValue.success(T data) : this._(AsyncStatus.success, data, null);
  const AsyncValue.error(String error) : this._(AsyncStatus.error, null, error);
}

extension GenderEnumExt on GenderEnum {
  String enumToString() {
    return name;
  }
}
