part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({required ThemeData themeData}) = _ThemeState;

  factory ThemeState.initial(ThemeData themeData) {
    return ThemeState(themeData: themeData);
  }
}
