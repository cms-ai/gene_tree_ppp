part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState() = _SignUpState;

  factory SignUpState.initial() {
    return const SignUpState();
  }
}
