part of 'onboard_bloc.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState() = _OnboardState;

  factory OnboardState.initial() {
    return const OnboardState();
  }
}
