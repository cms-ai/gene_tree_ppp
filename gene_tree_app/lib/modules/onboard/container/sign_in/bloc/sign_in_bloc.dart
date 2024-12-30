import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/utils/logger_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          emit(SignInState.initial());
        },
        signInWithGoogle: (value) async {
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
          // await _googleSignIn.signOut();
          // await _auth.signOut();
        },
      );
    });
  }
}
