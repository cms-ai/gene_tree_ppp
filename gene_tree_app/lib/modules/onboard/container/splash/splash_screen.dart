import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';
import './bloc/splash_bloc.dart';
part './models/splash_argument.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.argument,
  });
  final SplashArgument? argument;

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  State<SplashScreen> get splashState => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ThemeBloc themeBloc = Modular.get();
  final SplashBloc splashBloc = Modular.get();

  @override
  void initState() {
    super.initState();
    splashBloc.add(const SplashEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => splashBloc,
      child: BaseScreen(
        scaffoldBuilder: () {
          return BaseScaffold(
            configs: BaseScaffoldConfigs(
              nameScreen: "Splash",
              body: (themeState) => BlocListener<SplashBloc, SplashState>(
                listener: (context, state) {
                  Future.delayed(const Duration(seconds: 3), () {
                    switch (state.splashStateEnum) {
                      case SplashStateEnum.authenticated:
                        Modular.to.navigate(MainModule.path);
                        break;

                      case SplashStateEnum.unAuthenticated:
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(OnboardModuleEnum.signIn),
                        );
                        break;
                      case SplashStateEnum.firstLogin:
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(OnboardModuleEnum.intro),
                        );
                        break;
                      case SplashStateEnum.completeUser:
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(
                              OnboardModuleEnum.createClan),
                        );
                        break;
                      default:
                        break;
                    }
                  });
                },
                listenWhen: (previous, current) => previous != current,
                child: Center(
                  child: themeState.appThemeEnum == AppThemeEnum.darkTheme
                      ? Assets.images.darkLogo.svg()
                      : Assets.images.lightLogo.svg(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
