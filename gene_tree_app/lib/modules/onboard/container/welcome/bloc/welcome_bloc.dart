
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';
part 'welcome_bloc.freezed.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState.initial()) {
    on<WelcomeEvent>((event, emit) {
    });
  }
}
