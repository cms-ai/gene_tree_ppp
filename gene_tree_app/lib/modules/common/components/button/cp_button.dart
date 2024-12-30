import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
part './models/cp_button_configs.dart';

class CPButton extends StatelessWidget {
  const CPButton({
    super.key,
    required this.configs,
  });
  final CPButtonConfigs configs;
  @override
  Widget build(BuildContext context) {
    switch (configs.type) {
      case ButtonType.primary:
        return GestureDetector(
          onTap: configs.onTap,
          child: Container(
            padding: configs.padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            width: configs.width,
            height: configs.height,
            decoration: configs.decoration ??
                BoxDecoration(
                  color: themeData.color.btnColor2, // Màu nền của button
                  borderRadius: BorderRadius.circular(8.0), // Bo góc
                ),
            child: Center(
              child: Text(
                configs.content,
                style:
                    configs.textStyle ?? themeData.typo.t14Semibold.copyWith(),
              ),
            ),
          ),
        );
      case ButtonType.outline:
        return GestureDetector(
          onTap: configs.onTap,
          child: Container(
            padding: configs.padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            width: configs.width,
            height: configs.height,
            decoration: configs.decoration ??
                BoxDecoration(
                  border: Border.all(
                      color: themeData.color.btnColor2 // Màu viền của button
                      ),
                  borderRadius: BorderRadius.circular(8.0), // Bo góc
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                configs.prefixIcon ?? Container(),
                Text(
                  configs.content,
                  style: themeData.typo.t14Semibold.copyWith(
                    color:
                        themeData.color.mainPrimaryColor, // Màu chữ của button
                  ),
                ),
              ],
            ),
          ),
        );
      default:
    }
    return Container();
  }
}
