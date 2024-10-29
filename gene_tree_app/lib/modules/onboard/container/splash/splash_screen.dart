import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/utils/theme/models/app_theme_model.dart';
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
  late ThemeBloc themeBloc;
  @override
  void initState() {
    super.initState();
    themeBloc = Modular.get<ThemeBloc>();
    initData();
  }

  // Main function
  Future<void> initData() async {
    Future.delayed(const Duration(seconds: 5), () {
      Modular.to.navigate(
        OnboardModule.getRoutePath(OnboardModuleEnum.signIn),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return BaseScaffold(
          configs: BaseScaffoldConfigs(
            nameScreen: "Splash",
            body: BlocProvider(
              lazy: false,
              create: (context) => SplashBloc(),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    themeBloc.add(const ThemeEvent.toogleTheme());
                
                    // Modular.to.navigate(
                    //     "/onboard" + OnboardModuleEnum.signIn.path);
                  },
                  child: appThemeEnum == AppThemeEnum.darkTheme
                      ? Assets.images.darkLogo.svg()
                      : Assets.images.lightLogo.svg(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
