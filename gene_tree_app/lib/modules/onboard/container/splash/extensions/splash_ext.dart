part of '../splash_screen.dart';

extension SplashExt on _SplashScreenState {
  ///
  ///
  ///
  Future<void> initData() async {
    themeBloc = BlocProvider.of<ThemeBloc>(context);
    themeBloc.add(const ThemeEvent.initial());
  }
}
