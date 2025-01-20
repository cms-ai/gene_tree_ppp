import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/data/models/clan/request/update_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/delete_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/update_clan_usecase.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/bloc/dashboard_bloc.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/models/enums/dashboard_enum.dart';

part 'update_clan_event.dart';
part 'update_clan_state.dart';
part 'update_clan_bloc.freezed.dart';

class UpdateClanBloc extends Bloc<UpdateClanEvent, UpdateClanState> {
  final UpdateClanUsecase updateClanUsecase;
  final GetAllClanUsecase getAllClanUsecase;
  final DeleteClanUsecase deleteClanUsecase;
  final LocalStorage localStorage;
  UpdateClanBloc(
    this.updateClanUsecase,
    this.deleteClanUsecase,
    this.getAllClanUsecase,
    this.localStorage,
  ) : super(const UpdateClanState.initial()) {
    final _eventStreamController = StreamController<bool>();

    on<UpdateClanEvent>((event, emit) async {
      await event.map(
        started: (value) async {},
        submit: (value) async {
          try {
            emit(const UpdateClanState.loading());
            final bodyReq = UpdateClanRequest(
              clanName: value.nameClan,
              description: value.description,
            );
            final result = await updateClanUsecase.call(value.clanId, bodyReq);
            if (result != null) {
              emit(UpdateClanState.success(clanEnity: result));
            } else {
              throw Exception("Data not found");
            }
          } catch (e) {
            final error = await e.getMessageErr();
            emit(
              UpdateClanState.error(
                title: "Update failed",
                content: error ?? "",
              ),
            );
          }
        },
        deleteClan: (_DeleteClan value) async {
          try {
            emit(const UpdateClanState.loading());

            await deleteClanUsecase.call(value.clanId);
            emit(const UpdateClanState.success(clanEnity: null));
          } catch (e) {
            final error = await e.getMessageErr();
            emit(
              UpdateClanState.error(
                title: "Delete failed",
                content: error ?? "",
              ),
            );
            e.getMessageErr();
          }
        },
      );
    });
  }
}
