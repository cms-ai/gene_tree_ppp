import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/cm_text_field/cp_cm_text_field.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/modules/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/utils/theme/models/app_theme_model.dart';
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
            body: BlocProvider(
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
                    appThemeEnum == AppThemeEnum.darkTheme
                        ? Assets.images.darkLogo.svg(height: 40.h)
                        : Assets.images.lightLogo.svg(height: 40.h),
                    SizedBox(height: 30.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        hintTextConfigs: HintTextConfigs(
                          hintText: "Nhập email",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CPCmTextField(
                      configs: CPCmTextFieldConfigs(
                        hintTextConfigs: HintTextConfigs(
                          hintText: "Nhập password",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: themeData.typo.t14Semibold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: themeData.typo.t12Regular.copyWith(
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.icGoogle.svg(height: 20.h),
                          SizedBox(width: themeData.spacing.s10),
                          Text(
                            'Sign in with google',
                            style: themeData.typo.t14Regular.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account?",
                            style: themeData.typo.t12Regular.copyWith(),
                          ),
                          TextSpan(
                              text: " Sign Up",
                              style: themeData.typo.t12Bold.copyWith(
                                color: mainColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO:

                                  Modular.to.navigate(
                                    OnboardModule.getRoutePath(
                                        OnboardModuleEnum.signUp),
                                  );
                                })
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
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
