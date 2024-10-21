import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/auth/auth_module.dart';
import 'package:gene_tree_app/modules/auth/splash/splash_screen.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    r.child(
      '/',
      child: (context) => SplashScreen(
        argument: r.args.data,
      ),
    );
    super.routes(r);
  }
}

