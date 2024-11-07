import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/onboard/container/splash/bloc/splash_bloc.dart';

class MainModule extends Module {
  static const String path = "/dashboard/";

  static String getRoutePath(MainModuleEnum router) {
    return path + router.name;
  }

  @override
  void routes(RouteManager r) {
    // r.child(
    //   '/',
    //   child: (context) => SplashScreen(argument: r.args.data),
    // );
    // r.child(
    //   MainModuleEnum.intro.path,
    //   child: (context) => IntroScreen(argument: r.args.data),
    // );

    // r.child(
    //   MainModuleEnum.signIn.path,
    //   child: (context) => SignInScreen(argument: r.args.data),
    // );

    // r.child(
    //   MainModuleEnum.signUp.path,
    //   child: (context) => SignUpScreen(argument: r.args.data),
    // );
    // r.child(
    //   MainModuleEnum.welcome.path,
    //   child: (context) => WelcomeScreen(argument: r.args.data),
    // );

    super.routes(r);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton<DashboardBloc>(
      SplashBloc.new,
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

enum MainModuleEnum {
  splash("/"),
  intro("/intro"),
  welcome("/welcome"),
  signIn("/signIn"),
  signUp("/signUp"),
  ;

  final String path;
  const MainModuleEnum(this.path);
}
