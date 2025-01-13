import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/config/env_config.dart';
import 'package:gene_tree_app/core/network/dio_client.dart';
import 'package:gene_tree_app/data/api_services/exports.dart';
import 'package:gene_tree_app/data/repositories/auth_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/clan_repository_impl.dart';
import 'package:gene_tree_app/data/repositories/user_repository_impl.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';
import 'package:gene_tree_app/modules/common/bloc/bloc/app_bloc.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';

class AppModule extends Module {
  final dio = DioClient().dio;
  @override
  void binds(Injector i) {
    // init api service (firebase api, rest api)
    initApiServices(i);

    // init bloc
    i.addSingleton(() => AppBloc());
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
    i.addSingleton(
      () =>
          AuthApiService(dio, baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    i.addSingleton(
      () =>
          UserApiService(dio, baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    i.addSingleton(
      () =>
          ClanApiService(dio, baseUrl: EnvConfig.getRequired(EnvKeys.BASE_URL)),
    );

    // Đăng ký AuthRepository
    i.addSingleton<AuthRepository>(
      () => AuthRepositoryImpl(i.get<AuthApiService>()),
    );

    // Đăng ký UserRepository
    i.addSingleton<UserRepository>(
      () => UserRepositoryImpl(i.get<UserApiService>()),
    );

    // Đăng ký ClanRepository
    i.addSingleton<ClanRepository>(
      () => ClanRepositoryImpl(i.get<ClanApiService>()),
    );
  }
}
