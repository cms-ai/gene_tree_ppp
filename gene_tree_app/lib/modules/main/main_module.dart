import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/common_module.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/bloc/clan_detail_bloc.dart';
import 'package:gene_tree_app/modules/main/container/clan/clan_detail/clan_detail_screen.dart';
import 'package:gene_tree_app/modules/main/container/clan/create_clan/bloc/create_clan_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/event/bloc/event_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
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

    r.child(
      MainModuleEnum.clanDetail.path,
      child: (context) => ClanDetailScreen(argument: r.args.data),
    );

    super.routes(r);
  }

  @override
  List<Module> get imports => [CommonModule()];

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton<DashboardBloc>(
      DashboardBloc.new,
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
    i.addSingleton<HomeBloc>(
      HomeBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
    i.addSingleton<EventBloc>(
      EventBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );

    i.addSingleton<ClanDetailBloc>(
      ClanDetailBloc.new,
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
  createClan('/createClan'),
  updateClan('/updateClan'),
  clanDetail('/clanDetail');

  final String path;
  const MainModuleEnum(this.path);
}
