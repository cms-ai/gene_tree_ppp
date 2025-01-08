import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_dialog/cm_dialog_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
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
    final SignInBloc signInBloc = Modular.get();
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: (themeState) => BlocProvider(
              lazy: false,
              create: (context) => signInBloc,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.spacing.screenHorizontal,
                ),
                child: BlocListener<SignInBloc, SignInState>(
                  listener: (context, state) {
                    state.when(
                      () => {},
                      loading: () => {
                        CmDialogScreen(
                          argument: CmDialogArgument(
                            type: CmDialogType.loading,
                          ),
                        ).show(context)
                      },
                      success: (userId, isCompleteProfile) {
                        // Login successfully
                        if (isCompleteProfile) {
                          Modular.to.navigate(MainModule.path);
                        } else {
                          Modular.to.pushNamed(
                            OnboardModule.getRoutePath(
                                OnboardModuleEnum.createClan),
                          );
                        }
                      },
                      failure: (title, content) => {
                        CmDialogScreen(
                          argument: CmDialogArgument(
                            type: CmDialogType.alert,
                            title: title,
                            content: content,
                          ),
                        ).show(context)
                      },
                    );
                  },
                  child: _buildBody(themeState, signInBloc, context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(
    ThemeState themeState,
    SignInBloc signInBloc,
    BuildContext context,
  ) {
    return Column(
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
                  color: themeData.color.btnColor2 // Màu viền của button
                  ),
              borderRadius: BorderRadius.circular(8.0), // Bo góc
            ),
            onTap: () => signInBloc.add(SignInEvent.signInWithGoogle(context)),
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
                  color: themeData.color.btnColor2 // Màu viền của button
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
    );
  }
}
