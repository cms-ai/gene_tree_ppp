// import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:gene_tree_app/core/utils/helpers/auth_helpers.dart';  // Đảm bảo import đúng

// void main() {
//   late GoogleAuthHelper googleAuthHelper;
//   late MockFirebaseAuth mockFirebaseAuth;
//   late MockGoogleSignIn mockGoogleSignIn;
//   late MockGoogleSignInAccount mockGoogleSignInAccount;
//   late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
//   late MockUserCredential mockUserCredential;

//   setUp(() {
//     // Khởi tạo các mock objects
//     mockFirebaseAuth = MockFirebaseAuth();
//     mockGoogleSignIn = MockGoogleSignIn();
//     mockGoogleSignInAccount = MockGoogleSignInAccount();
//     mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
//     mockUserCredential = MockUserCredential();

//     // Tạo instance của GoogleAuthHelper và thiết lập các dependencies mock
//     googleAuthHelper = GoogleAuthHelper();
//     googleAuthHelper.setDependencies(
//         auth: mockFirebaseAuth, googleSignIn: mockGoogleSignIn);
//   });

//   group('signInWithGoogle', () {
//     test('should return UserCredential when signInWithGoogle is called', () async {
//       // Arrange: Mock các phương thức của GoogleSignIn
//       when(() => mockGoogleSignIn.signIn())
//           .thenAnswer((_) async => mockGoogleSignInAccount);
//       when(() => mockGoogleSignInAccount.authentication)
//           .thenAnswer((_) async => mockGoogleSignInAuthentication);
//       when(() => mockGoogleSignInAuthentication.accessToken)
//           .thenReturn('accessToken');
//       when(() => mockGoogleSignInAuthentication.idToken)
//           .thenReturn('idToken');

//       // Mock phương thức signInWithCredential
//       when(() => mockFirebaseAuth.signInWithCredential(any()))
//           .thenAnswer((_) async => mockUserCredential);

//       // Act: Gọi phương thức signInWithGoogle
//       final userCredential = await googleAuthHelper.signInWithGoogle();

//       // Assert: Kiểm tra kết quả trả về và số lần các phương thức được gọi
//       expect(userCredential, mockUserCredential);
//       verify(() => mockGoogleSignIn.signIn()).called(1);
//       verify(() => mockFirebaseAuth.signInWithCredential(any())).called(1);
//     });

//     test('should throw an error if Google SignIn fails', () async {
//       // Arrange: Giả lập trường hợp Google Sign-In thất bại
//       when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

//       // Act & Assert: Kiểm tra lỗi khi Google Sign-In thất bại
//       expect(() async => await googleAuthHelper.signInWithGoogle(),
//           throwsException);
//     });
//   });

//   group('signOut', () {
//     test('should call signOut method on FirebaseAuth', () async {
//       // Act: Gọi phương thức signOut
//       await googleAuthHelper.signOut();

//       // Assert: Kiểm tra xem phương thức signOut đã được gọi chưa
//       verify(() => mockFirebaseAuth.signOut()).called(1);
//       verify(() => mockGoogleSignIn.signOut()).called(1);
//     });
//   });
// }
