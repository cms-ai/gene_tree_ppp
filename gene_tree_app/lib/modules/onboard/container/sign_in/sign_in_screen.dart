import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/utils/theme/models/app_theme_model.dart';
import './bloc/sign_in_bloc.dart';
part './models/sign_in_argument.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    this.argument,
  });
  final SignInArgument? argument;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: (themeState) => BlocProvider(
              lazy: false,
              create: (context) => SignInBloc(),
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: themeData.spacing.screenHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    themeState.appThemeEnum == AppThemeEnum.darkTheme
                        ? Assets.images.darkLogo.svg(height: 50.h)
                        : Assets.images.lightLogo.svg(height: 50.h),
                    SizedBox(height: 30.h),
                    const Spacer(),

                    CPButton(
                      configs: CPButtonConfigs(
                        prefixIcon: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Assets.icons.icGoogle.svg(height: 20.h),
                        ),
                        content: OnboardLocalizations.current.signInWithGoogle,
                        type: ButtonType.outline,
                        decoration: BoxDecoration(
                          color: themeData.color.btnColor2.withOpacity(.1),
                          border: Border.all(
                              color: themeData
                                  .color.btnColor2 // Màu viền của button
                              ),
                          borderRadius: BorderRadius.circular(8.0), // Bo góc
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // if (Platform.isIOS)
                    CPButton(
                      configs: CPButtonConfigs(
                        prefixIcon: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Assets.icons.icApple.svg(
                            height: 20.h,
                            colorFilter: ColorFilter.mode(
                              themeData.color.mainPrimaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: themeData.color.btnColor2.withOpacity(.1),
                          border: Border.all(
                              color: themeData
                                  .color.btnColor2 // Màu viền của button
                              ),
                          borderRadius: BorderRadius.circular(8.0), // Bo góc
                        ),
                        content: "Sign in with Apple",
                        type: ButtonType.outline,
                        onTap: () {
                          Modular.to.navigate(
                            OnboardModule.getRoutePath(
                              OnboardModuleEnum.signIn,
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
