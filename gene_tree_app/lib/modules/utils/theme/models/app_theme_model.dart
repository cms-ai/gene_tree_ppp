import 'package:flutter/material.dart';
import 'package:gene_tree_app/modules/utils/theme/models/font_size/app_font_size_model.dart';
import 'package:gene_tree_app/modules/utils/theme/models/radius/app_radius_model.dart';
import 'package:gene_tree_app/modules/utils/theme/models/spacing/app_spacing_model_impl.dart';
import 'package:gene_tree_app/modules/utils/theme/models/typography/typography_model_impl.dart';
import 'package:gene_tree_app/modules/utils/theme/models/spacing/app_spacing_model.dart';
import 'package:gene_tree_app/modules/utils/theme/models/typography/typography_model.dart';

class AppThemeModel {
  final TypographyModelImpl typo;
  final AppSpacingModelImpl spacing;
  final AppFontSizeModel size;
  final AppRadiusModel radius;
  final ThemeData theme;
  AppThemeModel({
    required this.typo,
    required this.spacing,
    required this.size,
    required this.radius,
    required this.theme,
  });
}

var _lightThemeModel = AppThemeModel(
  typo: LightTypographyModel(),
  spacing: AppSpacingModel(),
  size: AppFontSizeModel(),
  radius: AppRadiusModel(),
  theme: ThemeData.light(),
);

var _darkThemeModel = AppThemeModel(
  typo: DarkTypographyModel(),
  spacing: AppSpacingModel(),
  size: AppFontSizeModel(),
  radius: AppRadiusModel(),
  theme: ThemeData.dark(),
);

enum AppThemeEnum {
  lighTheme,
  darkTheme,
}

extension AppThemeEnumExt on AppThemeEnum {
  AppThemeModel themeData() {
    switch (this) {
      case AppThemeEnum.lighTheme:
        return _lightThemeModel;
      case AppThemeEnum.darkTheme:
        return _darkThemeModel;
    }
  }
}
