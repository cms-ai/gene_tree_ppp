import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/app_module.dart';
import 'package:gene_tree_app/theme/app_theme.dart';
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
      child: MaterialApp.router(
        routerConfig: Modular.routerConfig,
        title: 'Flutter Demo',
        theme: AppTheme().currentTheme,
        // home: const MyApp(),
      ),
    ),
  );
}
