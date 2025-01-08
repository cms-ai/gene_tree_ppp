import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/bloc/create_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/create_clan_screen.dart';
import 'package:gene_tree_app/modules/onboard/container/intro/intro_screen.dart';
import 'package:gene_tree_app/modules/onboard/container/sign_in/bloc/sign_in_bloc.dart';
import 'package:gene_tree_app/modules/onboard/container/sign_in/sign_in_screen.dart';
import 'package:gene_tree_app/modules/onboard/container/sign_up/sign_up_screen.dart';
import 'package:gene_tree_app/modules/onboard/container/splash/bloc/splash_bloc.dart';
import 'package:gene_tree_app/modules/onboard/container/splash/splash_screen.dart';
import 'package:gene_tree_app/modules/onboard/container/welcome/bloc/welcome_bloc.dart';
import 'package:gene_tree_app/modules/onboard/container/welcome/welcome_screen.dart';

class OnboardModule extends Module {
  static const String path = "/onboard/";

  static String getRoutePath(OnboardModuleEnum router) {
    return path + router.name;
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => SplashScreen(argument: r.args.data),
    );
    r.child(
      OnboardModuleEnum.intro.path,
      child: (context) => IntroScreen(argument: r.args.data),
      children: [
        ChildRoute(
          OnboardModuleEnum.signIn.path,
          child: (context) => SignInScreen(argument: r.args.data),
        )
      ],
    );

    r.child(
      OnboardModuleEnum.signIn.path,
      child: (context) => SignInScreen(argument: r.args.data),
    );

    r.child(
      OnboardModuleEnum.signUp.path,
      child: (context) => SignUpScreen(argument: r.args.data),
    );
    r.child(
      OnboardModuleEnum.welcome.path,
      child: (context) => WelcomeScreen(argument: r.args.data),
    );
    r.child(
      OnboardModuleEnum.createClan.path,
      child: (context) => CreateClanScreen(argument: r.args.data),
    );

    super.routes(r);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<SplashBloc>(
      SplashBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<SignInBloc>(
      SignInBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addSingleton<CreateClanBloc>(
      CreateClanBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );

    i.addLazySingleton<WelcomeBloc>(
      WelcomeBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
  }
}

// class AuthModulePath {
//   final String splashPath = "/";
//   final String singInPath = "/";
// }

enum OnboardModuleEnum {
  splash("/"),
  intro("/intro"),
  welcome("/welcome"),
  signIn("/signIn"),
  signUp("/signUp"),
  createClan("/createClan");

  final String path;
  const OnboardModuleEnum(this.path);
}
