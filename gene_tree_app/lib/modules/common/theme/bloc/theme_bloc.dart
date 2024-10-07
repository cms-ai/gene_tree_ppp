// theme/counter_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class CounterBloc extends Bloc<ThemeEvent, ThemeState> {
  CounterBloc() : super(ThemeState.initial()) {
    on<ThemeEvent>((event, emit) {
      event.map(initial: (_Initial value) {});
    });
  }
}
