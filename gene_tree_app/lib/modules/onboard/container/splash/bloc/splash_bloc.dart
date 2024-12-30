import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/utils/databasse/share_preference_keys.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          var firstLogin =
              await SharePreferenceKeys.firstLogin.getData<bool>() ?? true;

          if (firstLogin) {
            await SharePreferenceKeys.firstLogin.saveData<bool>(false);
            emit(const SplashState.firstLogin());
          } else {
            await SharePreferenceKeys.firstLogin.saveData<bool>(true);

            // emit(const SplashState.unAuthenticated());
            emit(const SplashState.firstLogin());

          }
        },
      );
    });
  }
}
