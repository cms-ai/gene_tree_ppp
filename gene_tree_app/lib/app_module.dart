import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/utils/theme/bloc/theme_bloc.dart';

class AppModule extends Module {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  void binds(Injector i) {
    i.addSingleton(() => ThemeBloc());
    super.binds(i);
  }

  void initRoute() {
    Modular.setInitialRoute(OnboardModule.path);
  }

  @override
  void routes(RouteManager r) {
    r.module(OnboardModule.path, module: OnboardModule());

    super.routes(r);
  }
}
