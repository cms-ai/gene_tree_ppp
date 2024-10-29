import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/fonts.gen.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/utils/theme/models/typography/typography_model_impl.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/utils/theme/models/typography/typography_model_impl.dart';

///
/// text dùng cho dark theme vs giá trị [ThemeData.dark]
///

class LightTypographyModel extends TypographyModelImpl {
  @override
  TextStyle get t10Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t10Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t10Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );
}

///
/// text dùng cho dark theme vs giá trị [ThemeData.dark]
///

class DarkTypographyModel extends TypographyModelImpl {
  @override
  TextStyle get t10Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t10Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t10Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t12Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t14Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Bold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Regular => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: themeData.theme.colorScheme.primary,
      );

  @override
  TextStyle get t16Semibold => TextStyle(
        fontFamily: FontFamily.poppins,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: themeData.theme.colorScheme.primary,
      );
}
