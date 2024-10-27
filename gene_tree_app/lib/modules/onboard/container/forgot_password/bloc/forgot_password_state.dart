part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState() = _ForgotPasswordState;

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState();
  }
}
