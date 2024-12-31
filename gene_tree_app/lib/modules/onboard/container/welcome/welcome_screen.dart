import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:package_info_plus/package_info_plus.dart';
import './bloc/welcome_bloc.dart';
part './models/welcome_argument.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    this.argument,
  });
  final WelcomeArgument? argument;

  Future<void> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    print('App Name: ${packageInfo.appName}');
    print('Package Name: ${packageInfo.packageName}');
    print('Version: ${packageInfo.version}');
    print('Build Number: ${packageInfo.buildNumber}');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Home",
            body: (themeState) => BlocProvider(
              lazy: false,
              create: (context) => WelcomeBloc(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // themeState.appThemeEnum == AppThemeEnum.darkTheme
                    //     ? Assets.images.darkLogo.svg(height: 50.h)
                    //     : Assets.images.lightLogo.svg(height: 50.h),
                    Assets.images.welcome.image(width: double.infinity),
                    SizedBox(height: 45.h),
                    Text(
                      "Bạn đã sẵn sàng! Cảm ơn vì đã gia nhập ",
                      style:
                          themeState.appThemeEnum.themeData().typo.t12Regular,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Gene tree App",
                      style: themeState.appThemeEnum
                          .themeData()
                          .typo
                          .t14Bold
                          .copyWith(
                            color: themeData.color.mainSecondaryColor1,
                          ),
                    ),
                    const Spacer(),
                    CPButton(
                      configs: CPButtonConfigs(
                        content: "Let's go",
                        onTap: () {
                          Modular.to.navigate(MainModule.path);
                        },
                      ),
                    ),
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
