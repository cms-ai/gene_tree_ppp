import 'package:shared_preferences/shared_preferences.dart';

enum SharePreferenceKeys {
  /// Sử dụng cho ThemeData bao gôm các theme như: light theme, dark theme
  currentTheme
}

extension SharePreferenceKeysExt on SharePreferenceKeys {
  ///
  /// getData
  ///
  Future<String?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }

  ///
  /// remove data
  ///
  Future<void> removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);
  }

  ///
  /// setData
  ///
  Future<void> saveData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, value);
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
    await prefs.clear();
  }
}
