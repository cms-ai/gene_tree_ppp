import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/modules/main/main_module.dart';
import 'package:gene_tree_app/modules/onboard/onboard_module.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final AuthRepository authRepo = Modular.get();
    final ClanRepository clanRepo = Modular.get();
    final AuthRepository userRepo = Modular.get();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          emit(SignInState.initial());
        },
        signInWithGoogle: (value) async {
          try {
            EasyLoading.show(status: "Loading....");
            final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            // Create a new credential
            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken,
            );

            // Sign in with Firebase
            final UserCredential userCredential =
                await auth.signInWithCredential(credential);
            LoggerUtil.debugLog(userCredential.user.toString());

            final LoginGoogleRequest data = LoginGoogleRequest(
              email: userCredential.user?.email ?? "",
              name: userCredential.user?.displayName ?? "",
              avatarUrl: userCredential.user?.photoURL ?? "",
            );

            // Xử lý api login google
            final response = await LoginGoogleUsecase(authRepo).call(data);

            if (response == null || response.user.isDeleted == true) {
              EasyLoading.showError("Login failed.");
            } else {
              // Lưu local data của user
              await _saveUserLocalData(response);

              final clanSnap = await GetAllClanUsecase(clanRepo)
                  .call(response.user.userId ?? "");

              if (clanSnap.isEmpty) {
                // Điều hướng tới main module
                EasyLoading.showSuccess("Login successfully");
                Modular.to.navigate(MainModule.path);
              } else {
                EasyLoading.dismiss();
                Modular.to.pushNamed(
                  OnboardModule.getRoutePath(OnboardModuleEnum.createClan),
                );
              }
            }
          } catch (e) {
            EasyLoading.showError(e.toString());
          }
        },
      );
    });
  }

  Future<void> _saveUserLocalData(LoginGoogleResponse? response) async {
    await SharePreferenceKeys.token
        .saveData<String>(response?.accessToken ?? "");
    await SharePreferenceKeys.refreshToken
        .saveData<String>(response?.refreshToken ?? "");
    await SharePreferenceKeys.userId
        .saveData<String>(response?.user.userId ?? "");
  }
}
