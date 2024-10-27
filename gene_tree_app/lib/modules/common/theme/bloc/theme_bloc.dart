import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/modules/utils/databasse/share_preference_keys.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

ThemeData get themeData =>
    Modular.tryGet<ThemeBloc>()?.state.themeData ?? ThemeData.light();

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required bool isDarkMode,
  }) : super(
          ThemeState.initial(
            isDarkMode ? ThemeData.dark() : ThemeData.light(),
          ),
        ) {
    on<ThemeEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          // TODO: Init data
          var localTheme = await SharePreferenceKeys.currentTheme.getData();
          print("==== ${localTheme}");
          if (localTheme != null) {
            switch (localTheme) {
              case "dark":
                emit(state.copyWith(themeData: ThemeData.dark()));
              case "light":
                emit(state.copyWith(themeData: ThemeData.light()));
            }
          }
        },
        toogleTheme: (value) async {
          // TODO: Change theme
          emit(state.copyWith(
            themeData: state.themeData == ThemeData.dark()
                ? ThemeData.light()
                : ThemeData.dark(),
          ));

          print("==== ${state.themeData.brightness.name}");

          SharePreferenceKeys.currentTheme.saveData(
            state.themeData.brightness.name,
          );
        },
      );
    });
  }
}
