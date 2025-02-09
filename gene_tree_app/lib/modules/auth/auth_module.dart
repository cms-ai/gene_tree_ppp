import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  static String path = "/auth";
  @override
  void routes(RouteManager r) {
    // // Sign In Route
    // r.child(
    //   AuthModuleEnum.signIn.path,
    //   child: (context) => SignInScreen(
    //     argument: r.args.data,
    //   ),
    // );
    // ChildRoute(
    //   AuthModuleEnum.splash.path,
    //   child: (context) => SplashScreen(
    //     argument: r.args.data,
    //   ),
    // );
    // ChildRoute(
    //   AuthModuleEnum.signIn.path,
    //   child: (context) => SignInScreen(
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

enum AuthModuleEnum {
  splash("/splash"),
  signIn("/signIn"),
  signUp("signUp"),
  ;

  final String path;
  const AuthModuleEnum(this.path);
}
