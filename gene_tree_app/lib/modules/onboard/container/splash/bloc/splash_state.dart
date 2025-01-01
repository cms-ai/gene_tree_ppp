part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.unAuthenticated() = _UnAuthenticated;
  const factory SplashState.authenticated(bool hasComplete) = _Authenticated;
  const factory SplashState.firstLogin() = _FirstLogin;
}
