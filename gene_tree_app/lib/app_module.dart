import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/api/auth/auth_firebase_service.dart';
import 'package:gene_tree_app/api/auth/auth_service.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // init api service (firebase api, rest api)
    initApiServices(i);

    // init bloc
    i.addSingleton(() => ThemeBloc());
    super.binds(i);
  }

  void initRoute() {
    Modular.setInitialRoute(OnboardModule.path);
  }

  @override
  void routes(RouteManager r) {
    r.module(OnboardModule.path, module: OnboardModule());
    r.module(MainModule.path, module: MainModule());

    super.routes(r);
  }

  void initApiServices(Injector i) {
    i.addSingleton(() => AuthServices);
    i.addSingleton(() => AuthFirebaseService);
  }
}
