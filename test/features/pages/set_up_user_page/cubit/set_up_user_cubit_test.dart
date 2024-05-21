import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageRepository extends Mock implements StorageRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

void main() {
  late SetUpUserCubit sut;
  late MockRankingRepository repository;
  late MockStorageRepository repository1;

  setUp(() {
    repository = MockRankingRepository();
    repository1 = MockStorageRepository();

    sut = SetUpUserCubit(
        rankingRepository: repository, storageRepository: repository1);
  });
  group("addProfileToGlobal", () {
    test("should call rankingRepository.addProfileToGlobal once", () async {
      when(
        () => repository.addProfileToGlobal(
            nickName: "1", email: "1", imageUrl: "1", userId: "1"),
      ).thenAnswer((_) async => []);
      await sut.addProfileToGlobalRanking(
          nickName: "1", email: "1", imageUrl: "1", userId: "1");

      verify(
        () => repository.addProfileToGlobal(
            nickName: "1", email: "1", imageUrl: "1", userId: "1"),
      ).called(1);
    });
  });
}
