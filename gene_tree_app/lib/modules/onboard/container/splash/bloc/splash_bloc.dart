import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/utils/logger_utils.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.map(started: (value) async {
        LoggerUtil.infoLog("Change theme event;");
        emit(const SplashState.authenticated());
      });
    });
  }
}
