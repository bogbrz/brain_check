import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockStorageRepository extends Mock implements StorageRepository {}

void main() {
  late HomePageCubit sut;
  late MockQuestionRepository repository;
  late MockRankingRepository repository1;
  late MockStorageRepository repository2;
  setUp(() {
    repository = MockQuestionRepository();
    repository1 = MockRankingRepository();
    repository2 = MockStorageRepository();
    sut = HomePageCubit(
        questionRepository: repository,
        rankingRepository: repository1,
        storageRepository: repository2);
  });

  group("updateLifes", () {
    test("should call duelGameRepository.updateLifes once", () async {
      when(
        () => repository1.restoreLifes(playerId: "1", lastLogin: DateTime(1)),
      ).thenAnswer((_) async => []);
      await sut.updateLifes(profileId: "1", lastLogin: DateTime(1));

      verify(
        () => repository1.restoreLifes(playerId: "1", lastLogin: DateTime(1)),
      ).called(1);
    });
  });
}
