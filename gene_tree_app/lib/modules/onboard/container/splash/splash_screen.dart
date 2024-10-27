import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:gene_tree_app/modules/common/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/modules/utils/databasse/share_preference_keys.dart';
import './bloc/splash_bloc.dart';
part './models/splash_argument.dart';
part './extensions/splash_ext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.argument,
  });
  final SplashArgument? argument;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeBloc themeBloc;
  @override
  void initState() {
    super.initState();
    initData();
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
                child: BlocBuilder<ThemeBloc, ThemeState>(
                  buildWhen: (previous, current) =>
                      previous.themeData != current.themeData,
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        themeBloc.add(const ThemeEvent.toogleTheme());

                        // Modular.to.navigate(
                        //     "/onboard" + OnboardModuleEnum.signIn.path);
                      },
                      child: state.themeData == ThemeData.dark()
                          ? Assets.images.darkLogo.svg()
                          : Assets.images.lightLogo.svg(),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
