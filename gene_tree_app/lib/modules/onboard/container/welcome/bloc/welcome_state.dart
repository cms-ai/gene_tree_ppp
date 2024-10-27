part of 'welcome_bloc.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState() = _WelcomeState;

  factory WelcomeState.initial() {
    return const WelcomeState();
  }
}
