import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/core/network/dio_client.dart';
import 'package:gene_tree_app/data/api_services/auth_api_service.dart';
import 'package:gene_tree_app/data/repositories/auth_repository_impl.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
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
      () => AuthApiService(dio, baseUrl: dotenv.env['BASE_URL'] ?? ""),
    );

    // Đăng ký AuthRepository
    i.addSingleton<AuthRepository>(
      () => AuthRepositoryImpl(),
    );
    // i.addSingleton(() => AuthFirebaseService());
  }
}
