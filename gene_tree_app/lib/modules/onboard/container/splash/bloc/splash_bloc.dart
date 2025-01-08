import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/domain/repositories/user_repository.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserRepository userRepository = Modular.get();
  final ClanRepository clanRepository = Modular.get();
  SplashBloc() : super(const SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          var firstLogin =
              await SharePreferenceKeys.firstLogin.getData<bool>() ?? true;
          var token = await SharePreferenceKeys.token.getData<String>() ?? "";
          var userId = await SharePreferenceKeys.userId.getData<String>() ?? "";

          if (firstLogin) {
            await SharePreferenceKeys.firstLogin.saveData<bool>(false);
            add(
              const SplashEvent.changeSplashState(SplashStateEnum.firstLogin),
            );
          } else {
            if (token.isEmpty) {
              emit(state.copyWith(
                  splashStateEnum: SplashStateEnum.unAuthenticated));
            } else {
              final user = await GetUserUsecase(userRepository).call(userId);
              final clanList =
                  await GetAllClanUsecase(clanRepository).call(userId);
              if (user != null) {
                bool hasComplete = clanList.isNotEmpty;
                if (!hasComplete) {
                  add(const SplashEvent.changeSplashState(
                      SplashStateEnum.unAuthenticated));

                  return;
                }
              }
              add(const SplashEvent.changeSplashState(
                  SplashStateEnum.authenticated));
            }
          }
        },
        changeSplashState: (_ChangeSplashState value) {
          emit(
            state.copyWith(
              splashStateEnum: value.data,
            ),
          );
        },
      );
    });
  }
}
