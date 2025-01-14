import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
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
                  state.map(
                    initial: (value) {},
                    unAuthenticated: (value) {
                      if (value.firstLogin == true) {
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(OnboardModuleEnum.signIn),
                        );
                      } else {
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(OnboardModuleEnum.signIn),
                        );
                      }
                    },
                    authenticated: (value) {
                      if (value.completedUser == true) {
                        Modular.to.navigate(MainModule.path);
                      } else {
                        Modular.to.navigate(
                          OnboardModule.getRoutePath(
                            OnboardModuleEnum.createClan,
                          ),
                        );
                      }
                    },
                  );
                },
                listenWhen: (previous, current) => previous != current,
                child: Center(
                  child: ImageHelpers(themeEnum: themeState.appThemeEnum)
                      .getLogo(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
