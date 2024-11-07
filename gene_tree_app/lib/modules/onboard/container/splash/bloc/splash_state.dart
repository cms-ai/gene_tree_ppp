part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState() = _SplashState;

  factory SplashState.initial() {
    return const SplashState();
  }

  factory SplashState.unAuthenticated() {
    return const SplashState();
  }
  factory SplashState.authenticated() {
    return const SplashState();
  }
}
