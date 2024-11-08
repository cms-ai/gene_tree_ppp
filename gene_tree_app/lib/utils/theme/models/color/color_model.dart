import 'package:flutter/material.dart';
import 'package:gene_tree_app/utils/theme/models/color/color_model_impl.dart';

class LightColorModel implements ColorModelImpl {
  @override
  Color get bgColor1 => const Color(0xFFFFFFFF);

  @override
  Color get bgColor2 => const Color(0xFF000000);

  @override
  Color get btnColor1 => const Color(0xFFF2D5A9);

  @override
  Color get btnColor2 => const Color(0xFFD36C26);

  @override
  LinearGradient get linegradientColor => throw UnimplementedError();

  @override
  LinearGradient get linegradientColor1 => throw UnimplementedError();

  @override
  LinearGradient get linegradientColor2 => throw UnimplementedError();

  @override
  // Color get mainBgColor1 => const Color(0xFF821C0D);
  Color get mainBgColor1 => const Color(0xFFFFFFFF);

  @override
  Color get mainPrimaryColor => const Color(0xFFA43A16);

  @override
  Color get mainSecondaryColor1 => const Color(0xFFCDA66F);

  @override
  Color get mainSecondaryColor2 => const Color(0xFF3F4EAB);

  @override
  Color get mainSecondaryColor3 => const Color(0xFFA0A884);

  @override
  Color get stCollectColor => throw UnimplementedError();

  @override
  Color get stSpendColor => throw UnimplementedError();

  @override
  Color get stStillColor => throw UnimplementedError();

  @override
  Color get stWarningColor => throw UnimplementedError();

  @override
  Color get textBodyColor => const Color(0xFF4B4747);

  @override
  Color get textDisableColor => const Color(0xFFE7E7E7);

  @override
  Color get textLabelColor => const Color(0xFF8B8887);

  @override
  Color get textPlaceholderColor => const Color(0xFFCEC6C5);

  @override
  Color get textTitleColor => const Color(0xFF240E0A);
}

class DarkColorModel implements ColorModelImpl {
  @override
  Color get bgColor1 => const Color(0xFF000000);

  @override
  Color get bgColor2 => const Color(0xFFFFFFFF);

  @override
  Color get btnColor1 => const Color(0xFFF2D5A9);

  @override
  Color get btnColor2 => const Color(0xFFD36C26);

  @override
  LinearGradient get linegradientColor => throw UnimplementedError();

  @override
  LinearGradient get linegradientColor1 => throw UnimplementedError();

  @override
  LinearGradient get linegradientColor2 => throw UnimplementedError();

  @override
  Color get mainBgColor1 => Color(0xFF000000);
  // Color get mainBgColor1 => const Color(0xFF821C0D);

  @override
  Color get mainPrimaryColor => const Color(0xFFA43A16);

  @override
  Color get mainSecondaryColor1 => const Color(0xFFCDA66F);

  @override
  Color get mainSecondaryColor2 => const Color(0xFF3F4EAB);

  @override
  Color get mainSecondaryColor3 => const Color(0xFFA0A884);

  @override
  Color get stCollectColor => throw UnimplementedError();

  @override
  Color get stSpendColor => throw UnimplementedError();

  @override
  Color get stStillColor => throw UnimplementedError();

  @override
  Color get stWarningColor => throw UnimplementedError();

  @override
  Color get textBodyColor => const Color(0xFF4B4747);

  @override
  Color get textDisableColor => const Color(0xFFE7E7E7);

  @override
  Color get textLabelColor => const Color(0xFF8B8887);

  @override
  Color get textPlaceholderColor => const Color(0xFFCEC6C5);

  @override
  Color get textTitleColor => const Color(0xFF240E0A);
}
