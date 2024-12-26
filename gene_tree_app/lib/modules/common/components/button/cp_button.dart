import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
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
            decoration: BoxDecoration(
              color: themeData.color.btnColor2, // Màu nền của button
              borderRadius: BorderRadius.circular(8.0), // Bo góc
            ),
            child: Center(
              child: Text(
                configs.content,
                style: themeData.typo.t14Semibold.copyWith(),
              ),
            ),
          ),
        );
      default:
    }
    return Container();
  }
}
