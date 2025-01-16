import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_events_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllClanUsecase getAllClanUsecase;
  final GetClanEventsUsecase getClanEventsUsecase;
  final LocalStorage localStorage;
  final GetUserUsecase getUserUsecase;
  HomeBloc({
    required this.getAllClanUsecase,
    required this.getClanEventsUsecase,
    required this.localStorage,
    required this.getUserUsecase,
  }) : super(
          const HomeState.initial(
            userData: AsyncValue.loading(),
            clanData: AsyncValue.loading(),
            clanEvents: AsyncValue.loading(),
          ),
        ) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          add(const _FetchUserData());
          add(const _FetchClanData());
        },
        fetchUserData: (_FetchUserData value) async {
          final userId =
              await localStorage.get<String>(SharePreferenceKeys.userId.name) ??
                  "";
          final userRes = await getUserUsecase.call(userId);

          if (userRes != null) {
            emit(state.copyWith(userData: AsyncValue.success(userRes)));
          }
        },
        fetchClanData: (_FetchClanData value) async {
          final userId =
              await localStorage.get<String>(SharePreferenceKeys.userId.name) ??
                  "";

          String? localClanId = await localStorage.get<String>(
            SharePreferenceKeys.clanId.name,
          );
          final clanList = await getAllClanUsecase.call(userId);

          if (clanList.isNotEmpty) {
            if (localClanId == null) {
              localClanId = clanList.first.id;
              localStorage.save(
                SharePreferenceKeys.clanId.name,
                localClanId,
              );
            }
            final clanData = clanList.firstWhere(
              (element) => element.id == localClanId,
            );
            emit(state.copyWith(clanData: AsyncValue.success(clanData)));

            final clanEvents =
                await getClanEventsUsecase.call(clanList.first.id);
            emit(
              state.copyWith(
                clanEvents: AsyncValue.success(clanEvents),
              ),
            );
          } else {
            localStorage.remove(SharePreferenceKeys.clanId.name);
          }
        },
      );
    });
  }
}
