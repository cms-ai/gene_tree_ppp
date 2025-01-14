// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:gene_tree_app/modules/onboard/container/splash/bloc/splash_bloc.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
// import 'package:gene_tree_app/domain/repositories/clan_repository.dart';
// import 'package:gene_tree_app/domain/repositories/user_repository.dart';

// class MockUserRepository extends Mock implements UserRepository {}
// class MockClanRepository extends Mock implements ClanRepository {}
// class MockLocalStorage extends Mock implements LocalStorage {}

// void main() {
//   group('SplashBloc', () {
//     late SplashBloc splashBloc;
//     late MockUserRepository mockUserRepository;
//     late MockClanRepository mockClanRepository;
//     late MockLocalStorage mockLocalStorage;

//     setUp(() {
//       mockUserRepository = MockUserRepository();
//       mockClanRepository = MockClanRepository();
//       mockLocalStorage = MockLocalStorage();
//       splashBloc = SplashBloc(

//         localStorage: mockLocalStorage,
//       );
//     });

//     tearDown(() {
//       splashBloc.close();
//     });
//     });

//     test('initial state is SplashInitial', () {
//       expect(splashBloc, const SplashState.initial());
//     });

//     blocTest<SplashBloc, SplashState>(
//       'emits [SplashLoading, SplashLoaded] when SplashStarted is added',
//       build: () {
//         when(() => mockLocalStorage.get<bool>(any())).thenAnswer((_) async => false);
//         when(() => mockLocalStorage.get<String>(any())).thenAnswer((_) async => 'token');
//         when(() => mockUserRepository.getUser(any())).thenAnswer((_) async => null);
//         when(() => mockClanRepository.getAllClans(any())).thenAnswer((_) async => []);
//         return splashBloc;
//       },
//       act: (bloc) => bloc.add(const SplashEvent.started()),
//       expect: () => [
//         const SplashState.unAuthenticated(firstLogin: false),
//       ],
//     );
//   });
// }