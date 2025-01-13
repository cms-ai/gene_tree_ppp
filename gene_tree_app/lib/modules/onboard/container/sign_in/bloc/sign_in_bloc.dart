import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/exceptions/http_exceptions.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GoogleAuthHelper authHelper;
  final AuthRepository authRepo;
  final ClanRepository clanRepo;
  SignInBloc({
    required this.authHelper,
    required this.authRepo,
    required this.clanRepo,
  }) : super(SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          emit(SignInState.initial());
        },
        signInWithGoogle: (value) async {
          emit(const SignInState.loading());
          try {
            final userCredential = await authHelper.signInWithGoogle();

            final loginResponse = await LoginGoogleUsecase(authRepo).call(
              LoginGoogleRequest(
                email: userCredential.user?.email ?? "",
                name: userCredential.user?.displayName ?? "",
                avatarUrl: userCredential.user?.photoURL ?? "",
              ),
            );

            final userId = JwtHelper()
                .getUserIdFromToken(loginResponse?.accessToken ?? "");

            if (userId != null) {
              await _saveUserLocalData(loginResponse, userId);

              final clanSnap = await GetAllClanUsecase(clanRepo).call(userId);
              emit(SignInState.success(
                  userId: userId, isCompletedProfile: clanSnap.isNotEmpty));
            } else {
              emit(const SignInState.failure(
                title: "Login failed",
                content: "User ID not found in token.",
              ));
            }
          } catch (error) {
            // authHelper.signOut();
            final errorText = await error.getMessageErr();
            emit(SignInState.failure(
              title: "Login failed",
              content: errorText ?? "",
            ));
          }
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
