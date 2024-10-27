import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/auth/auth_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds

    super.binds(i);
  }

  void initRoute() {
    // Modular.setInitialRoute(OnboardModule.path);
  }

  @override
  void routes(RouteManager r) {
    ModuleRoute(OnboardModule.path, module: OnboardModule());
    ModuleRoute(AuthModule.path, module: AuthModule());

    super.routes(r);
  }

  ///
  /// bind screen route
  ///
  // void _bindRoutes(Injector i) {
  //   r.child('/', child: (context) => HomePage()),
  // }
}
