import 'package:flutter/material.dart';
import 'package:gene_tree_app/theme/base_theme.dart';

class AppThemeModel {
  final ThemeData themeData;

  AppThemeModel(this.themeData);
}

class AppTheme extends BaseTheme {
  static final AppTheme _instance = AppTheme._internal();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  factory AppTheme() {
    return _instance;
  }

  ThemeData get currentTheme {
    return _isDarkMode ? darkTheme : lightTheme;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
  }

  AppTheme._internal();
  @override
  ThemeData get darkTheme => ThemeData.dark();

  @override
  ThemeData get lightTheme => ThemeData.light();
}
