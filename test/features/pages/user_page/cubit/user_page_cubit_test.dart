import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_cubit.dart';
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late UserPageCubit sut;
  late MockStorageRepository repository;
  late MockRankingRepository repository1;
  late MockAuthRepository repository2;

  setUp(() {
    repository = MockStorageRepository();
    repository1 = MockRankingRepository();
    repository2 = MockAuthRepository();
    sut = UserPageCubit(
        authRepository: repository2,
        rankingRepository: repository1,
        storageRepository: repository);
  });
  group("updateProfile", () {
    test("should call rankingRepository.updateProfile once", () async {
      when(
        () =>
            repository1.updateProfile(imageUrl: "1", docId: "1", nickName: "1"),
      ).thenAnswer((_) async => []);
      await sut.updateProfile(imageUrl: "1", docId: "1", nickName: "1");

      verify(
        () =>
            repository1.updateProfile(imageUrl: "1", docId: "1", nickName: "1"),
      ).called(1);
    });
  });
  group("signOut", () {
    test("should call authRepository.signOut once", () async {
      when(
        () => repository2.signOut(),
      ).thenAnswer((_) async => []);
      await sut.signOut();

      verify(
        () => repository2.signOut(),
      ).called(1);
    });
  });
}
