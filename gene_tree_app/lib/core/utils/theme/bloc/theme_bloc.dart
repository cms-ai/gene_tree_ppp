import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/theme/models/app_theme_model.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

AppThemeModel get themeData =>
    Modular.tryGet<ThemeBloc>()?.state.appThemeEnum.themeData() ??
    AppThemeEnum.lightTheme.themeData();

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState.initial(
          AppThemeEnum.lightTheme,
          const Color(0xFF00BF4D),
        )) {
    on<ThemeEvent>(
      (event, emit) async {
        await event.map(
          initial: (value) async {
            var localTheme =
                await SharePreferenceKeys.currentTheme.getData<String>();
            if (localTheme != null) {
              if (localTheme == AppThemeEnum.darkTheme.name) {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.darkTheme));
              } else {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.lightTheme));
              }
            }
            configLoading(state.appThemeEnum);
          },
          toogleTheme: (value) async {
            emit(
              state.copyWith(
                appThemeEnum: state.appThemeEnum == AppThemeEnum.lightTheme
                    ? AppThemeEnum.darkTheme
                    : AppThemeEnum.lightTheme,
              ),
            );

            SharePreferenceKeys.currentTheme.saveData<String>(
              state.appThemeEnum.name,
            );
            configLoading(state.appThemeEnum);
          },
          changeMainColor: (_ChangeMainColor value) async {
            emit(state.copyWith(
              mainColor: value.color,
            ));
          },
        );
      },
    );
  }

  void configLoading(AppThemeEnum theme) {
    switch (theme) {
      case AppThemeEnum.lightTheme:
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.dark
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = Colors.yellow
          ..backgroundColor = Colors.green
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.yellow
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true
          ..dismissOnTap = false;
        break;
      case AppThemeEnum.darkTheme:
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = Colors.yellow
          ..backgroundColor = Colors.green
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.yellow
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true
          ..dismissOnTap = false;
        break;
      default:
    }
  }
}
