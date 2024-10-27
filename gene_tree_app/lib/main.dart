import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/app_module.dart';
import 'package:gene_tree_app/modules/common/theme/bloc/theme_bloc.dart';
// import 'firebase_options.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // KHởi tạo router chạy đầu tiên
  AppModule().initRoute();
  // initialize singleton
  runApp(
    ModularApp(
      module: AppModule(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final themeBloc = Modular.get<ThemeBloc>();
    themeBloc.add(const ThemeEvent.initial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: Modular.get<ThemeBloc>())],
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          setState(() {});
        },
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: Modular.routerConfig,
            title: 'Flutter Demo',
            theme: state.themeData,
            // home: const MyApp(),
          );
        },
      ),
    );
  }
}
