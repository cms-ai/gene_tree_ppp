part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required int counter,
  }) = _ThemeState;

  factory ThemeState.initial() {
    return const ThemeState(
      counter: 0,
    );
  }
}
