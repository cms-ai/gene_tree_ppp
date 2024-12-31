import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/localizations/app_localizations.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _xPosition = 20; // Vị trí ban đầu theo trục X
  double _yPosition = 20; // Vị trí ban đầu theo trục Y
  @override
  void initState() {
    final themeBloc = Modular.get<ThemeBloc>();
    themeBloc.add(const ThemeEvent.initial());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: Modular.get<ThemeBloc>(),
            ),
          ],
          child: BlocConsumer<ThemeBloc, ThemeState>(
            listener: (context, state) async {
              LoggerUtil.debugLog("Change theme: ${state.appThemeEnum}");
              await SharePreferenceKeys.currentTheme
                  .saveData<String>(state.appThemeEnum.name);
            },
            builder: (context, state) {
              return MaterialApp.router(
                localizationsDelegates: AppLocalizations.appLocalizations,
                routerConfig: Modular.routerConfig,
                title: 'Flutter Demo',
                theme: state.appThemeEnum.themeData().theme,
                builder: EasyLoading.init(
                  builder: (context, child) {
                    return Stack(
                      children: [
                        child ?? const SizedBox(),
                        if (kDebugMode) _buildDebugWidget(screenSize, state),
                      ],
                    );
                  },
                ),
                // home: const MyApp(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDebugWidget(Size screenSize, ThemeState state) {
    return Positioned(
      left: _xPosition,
      top: _yPosition,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            // Cập nhật vị trí nút
            _xPosition += details.delta.dx;
            _yPosition += details.delta.dy;

            // Giới hạn vị trí trong màn hình
            _xPosition = _xPosition.clamp(
                0, screenSize.width - 56); // 56 là kích thước nút
            _yPosition =
                _yPosition.clamp(0, screenSize.height - 56 - kToolbarHeight);
          });
        },
        child: FloatingActionButton(
          backgroundColor: state.appThemeEnum
              .themeData()
              .color
              .mainSecondaryColor2
              .withOpacity(.4),
          onPressed: () {
            Modular.get<ThemeBloc>().add(const ThemeEvent.toogleTheme());
          },
          child: const Icon(
            Icons.bug_report,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
