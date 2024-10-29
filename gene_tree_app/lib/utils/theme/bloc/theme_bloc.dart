import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/utils/theme/models/app_theme_model.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

AppThemeModel get themeData =>
    Modular.tryGet<ThemeBloc>()?.state.appThemeEnum.themeData() ??
    AppThemeEnum.lighTheme.themeData();
Color get mainColor =>
    Modular.tryGet<ThemeBloc>()?.state.mainColor ?? const Color(0xFF00BF4D);

AppThemeEnum get appThemeEnum =>
    Modular.tryGet<ThemeBloc>()?.state.appThemeEnum ?? AppThemeEnum.lighTheme;

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState.initial(
          AppThemeEnum.lighTheme,
          Color(0xFF00BF4D),
        )) {
    on<ThemeEvent>(
      (event, emit) async {
        await event.map(
          initial: (value) async {
            var localTheme = await SharePreferenceKeys.currentTheme.getData();
            if (localTheme != null) {
              if (localTheme == AppThemeEnum.darkTheme.name) {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.darkTheme));
              } else {
                emit(state.copyWith(appThemeEnum: AppThemeEnum.darkTheme));
              }
            }
          },
          toogleTheme: (value) async {
            emit(
              state.copyWith(
                appThemeEnum: state.appThemeEnum == AppThemeEnum.lighTheme
                    ? AppThemeEnum.darkTheme
                    : AppThemeEnum.lighTheme,
              ),
            );

            SharePreferenceKeys.currentTheme.saveData(
              state.appThemeEnum.name,
            );
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
}