import 'package:flutter_modular/flutter_modular.dart';

class OnboardModule extends Module {
  static const String path = "/onboard";
  @override
  void routes(RouteManager r) {
    // ChildRoute(
    //   OnboardModuleEnum.splash.path,
    //   child: (context) => SplashScreen(
    //     argument: r.args.data,
    //   ),
    // );
    // ChildRoute(
    //   OnboardModuleEnum.welcome.path,
    //   child: (context) => WelcomeScreen(
    //     argument: r.args.data,
    //   ),
    // );
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    // i.addSingleton<SplashBloc>(
    //   SplashBloc.new,
    //   config: BindConfig(
    //     onDispose: (bloc) => bloc.close(),
    //   ),
    // );
    // i.addSingleton<SignInBloc>(
    //   SignInBloc.new,
    //   config: BindConfig(
    //     onDispose: (bloc) => bloc.close(),
    //   ),
    // );
  }
}

// class AuthModulePath {
//   final String splashPath = "/";
//   final String singInPath = "/";
// }

enum OnboardModuleEnum {
  splash("/splash"),
  welcome("/welcome"),
  ;

  final String path;
  const OnboardModuleEnum(this.path);
}
