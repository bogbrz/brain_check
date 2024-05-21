import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockDuelGameRepository extends Mock implements DuelGameRepository {}

void main() {
  late RankedGameCubit sut;
  late MockQuestionRepository repository;
  late MockRankingRepository repository1;

  setUp(() {
    repository = MockQuestionRepository();
    repository1 = MockRankingRepository();

    sut = RankedGameCubit(
        rankingRepository: repository1, questionRepository: repository);
  });
  group("setStartTime", () {
    test("should call rankingRepository.setStartTime once", () async {
      when(
        () => repository1.setStartTime(playerId: "1"),
      ).thenAnswer((_) async => []);
      await sut.setStartTime(playerId: "1");

      verify(
        () => repository1.setStartTime(playerId: "1"),
      ).called(1);
    });
  });
  group("updateLifes", () {
    test("should call rankingRepository.updateLifes once", () async {
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
