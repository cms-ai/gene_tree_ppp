import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';

part 'create_clan_event.dart';
part 'create_clan_state.dart';
part 'create_clan_bloc.freezed.dart';

class CreateClanBloc extends Bloc<CreateClanEvent, CreateClanState> {
  final LocalStorage localStorage;
  final ClanRepository clanRepository = Modular.get();
  CreateClanBloc({
    required this.localStorage,
  }) : super(const CreateClanState.initial(isValid: false)) {
    on<CreateClanEvent>(
      (event, emit) async {
        await event.map(
          started: (value) async {},
          createClanEvent: (value) async {
            try {
              EasyLoading.show(status: "Creating...");
              final userId = await localStorage
                  .get<String>(SharePreferenceKeys.userId.name);
              final reqBody = CreateClanRequest(
                clanName: value.name,
                description: value.description,
                authorId: userId ?? "",
              );
              await clanRepository.createClan(reqBody);
              EasyLoading.showSuccess("Succesfully");

              navigateScreen();
            } catch (e) {
              LoggerUtil.debugLog(e.toString());
              EasyLoading.showError(e.toString());
            }
          },
        );
      },
    );
  }

  void navigateScreen() {
    final currentRoute = Modular.to.path;
    if (currentRoute.contains(OnboardModule.path)) {
      Modular.to.pushNamedAndRemoveUntil(
        OnboardModule.getRoutePath(OnboardModuleEnum.welcome),
        (route) => false,
      );
    } else {
      Modular.to.pop();
    }
  }
}
