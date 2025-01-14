import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/dio_client.dart';
import 'package:gene_tree_app/modules/common/common_module.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/data/api_services/exports.dart';
import 'package:gene_tree_app/data/repositories/auth_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/clan_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/user_repository_impl.dart';
import 'package:gene_tree_app/domain/repositories/exports.dart';
import 'package:gene_tree_app/modules/common/bloc/bloc/app_bloc.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
        OnboardModule(),
      ];
  void initRoute() {
    Modular.setInitialRoute(OnboardModule.path);
  }

  @override
  void routes(RouteManager r) {
    r.module(OnboardModule.path, module: OnboardModule());
    r.module(MainModule.path, module: MainModule());

    super.routes(r);
  }
}
