part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.initial() = _Initial;
  const factory ThemeEvent.toogleTheme() = _ToogleTheme;
}
