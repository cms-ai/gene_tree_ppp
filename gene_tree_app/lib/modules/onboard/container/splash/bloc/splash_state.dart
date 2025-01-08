part of 'splash_bloc.dart';

enum SplashStateEnum {
  unAuthenticated,
  authenticated,
  firstLogin,
  completeUser,
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial({
    SplashStateEnum? splashStateEnum,
  }) = _Initial;
}
