part of 'sign_inn_bloc.dart';

@freezed
class SignInnState with _$SignInnState {
  const factory SignInnState() = _SignInnState;

  factory SignInnState.initial() {
    return const SignInnState();
  }
}
