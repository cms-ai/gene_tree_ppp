part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({required AppThemeModel themeData}) = _ThemeState;

  factory ThemeState.initial(AppThemeModel appThemeModel) {
    return ThemeState(themeData: appThemeModel);
  }
}
