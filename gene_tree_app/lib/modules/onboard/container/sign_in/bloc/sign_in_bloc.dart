import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/helpers/auth_helpers.dart';
import 'package:gene_tree_app/core/utils/helpers/error_helpers.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    final GoogleAuthHelper authHelper = GoogleAuthHelper();

    final AuthRepository authRepo = Modular.get();
    final ClanRepository clanRepo = Modular.get();

    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          emit(SignInState.initial());
        },
        signInWithGoogle: (value) async {
          emit(const SignInState.loading());

          final userCredential = await authHelper.signInWithGoogle();
          LoggerUtil.debugLog(userCredential.user.toString());

          // Call Login google api
          await LoginGoogleUsecase(authRepo).call(
            LoginGoogleRequest(
              email: userCredential.user?.email ?? "",
              name: userCredential.user?.displayName ?? "",
              avatarUrl: userCredential.user?.photoURL ?? "",
            ),
            onExecuteError: (error) {
              emit(
                SignInState.failure(
                  title: "Login failed",
                  content: error.getDefaultError(),
                ),
              );
              return;
            },
            onExecuteDone: (response) async {
              final data = response.data;
              // decoded token
              Map<String, dynamic> decodedToken =
                  JwtDecoder.decode(data?.accessToken ?? "");

              final String? userId = decodedToken["id"];
              if (data != null && userId != null) {
                await _saveUserLocalData(data, userId);

                final clanSnap = await GetAllClanUsecase(clanRepo).call(userId);
                emit(SignInState.success(
                    userId: userId, isCompletedProfile: clanSnap.isNotEmpty));
              }
            },
          );
        },
      );
    });
  }

  Future<void> _saveUserLocalData(
      LoginGoogleResponse? response, String userId) async {
    await SharePreferenceKeys.token
        .saveData<String>(response?.accessToken ?? "");
    await SharePreferenceKeys.refreshToken
        .saveData<String>(response?.refreshToken ?? "");
    await SharePreferenceKeys.userId.saveData<String>(userId);
  }
}
