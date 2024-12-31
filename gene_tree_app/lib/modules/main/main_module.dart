import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/bloc/create_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/create_clan_screen.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/dashboard_screen.dart';

class MainModule extends Module {
  static const String path = "/dashboard/";

  static String getRoutePath(MainModuleEnum router) {
    return path + router.name;
  }

  @override
  void routes(RouteManager r) {
    r.child(
      MainModuleEnum.dashboard.path,
      child: (context) => DashboardScreen(argument: r.args.data),
    );

    super.routes(r);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<DashboardBloc>(
      DashboardBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addLazySingleton<CreateClanBloc>(
      CreateClanBloc.new,
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
  dashboard("/"),
  // clan
  createClan('/clan/create'),
  updateClan('/clan/update');

  final String path;
  const MainModuleEnum(this.path);
}
