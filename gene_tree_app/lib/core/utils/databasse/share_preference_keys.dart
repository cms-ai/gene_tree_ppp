import 'package:shared_preferences/shared_preferences.dart';

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

extension SharePreferenceKeysExt on SharePreferenceKeys {
  ///
  /// getString
  ///
  Future<T?> getData<T>() async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) {
      return prefs.getString(name) as T?;
    } else if (T == int) {
      return prefs.getInt(name) as T?;
    } else if (T == bool) {
      return prefs.getBool(name) as T?;
    } else if (T == double) {
      return prefs.getDouble(name) as T?;
    } else {
      throw ArgumentError("Unsupported type: $T");
    }
  }

  ///
  /// removeString
  ///
  Future<void> removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);
  }

  ///
  /// setData
  ///
  Future<bool> saveData<T>(T value) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(name, value);

    if (value is String) {
      return prefs.setString(name, value);
    } else if (value is int) {
      return prefs.setInt(name, value);
    } else if (value is bool) {
      return prefs.setBool(name, value);
    } else if (value is double) {
      return prefs.setDouble(name, value);
    } else {
      throw ArgumentError("Unsupported type: ${value.runtimeType}");
    }
  }

  ///
  /// containe key or not
  ///
  Future<bool> containsKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(name);
  }

  ///
  /// clear all data from keys in [SharePreferenceKeys.values]
  ///

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    for (var key in SharePreferenceKeys.values) {
      await prefs.remove(key.name);
    }
  }
}
