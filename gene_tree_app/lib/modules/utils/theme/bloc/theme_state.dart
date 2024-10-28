part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required AppThemeEnum appThemeEnum,
  }) = _ThemeState;

  factory ThemeState.initial(AppThemeEnum appThemeEnum) {
    return ThemeState(
      appThemeEnum: appThemeEnum,
    );
  }
}
