
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_inn_event.dart';
part 'sign_inn_state.dart';
part 'sign_inn_bloc.freezed.dart';

class SignInnBloc extends Bloc<SignInnEvent, SignInnState> {
  SignInnBloc() : super(SignInnState.initial()) {
    on<SignInnEvent>((event, emit) {
    });
  }
}
