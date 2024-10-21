import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:gene_tree_app/modules/auth/sign_in/sign_in_screen.dart';
import 'package:gene_tree_app/modules/auth/splash/bloc/splash_bloc.dart';
import 'package:gene_tree_app/modules/auth/splash/splash_screen.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    // Splash route
    r.child(
      AuthModuleEnum.splash.name,
      child: (context) => SplashScreen(
        argument: r.args.data,
      ),
    );

    // Sign In Route
    r.child(
      AuthModuleEnum.signIn.name,
      child: (context) => SignInScreen(
        argument: r.args.data,
      ),
    );
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton<SplashBloc>(
      SplashBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addSingleton<SignInBloc>(
      SignInBloc.new,
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

enum AuthModuleEnum {
  splash,
  signIn,
  signUp,
}
