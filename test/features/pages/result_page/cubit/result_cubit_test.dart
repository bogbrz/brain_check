import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockDuelGameRepository extends Mock implements DuelGameRepository {}

void main() {
  late ResultCubit sut;
  late MockDuelGameRepository repository;
  late MockRankingRepository repository1;

  setUp(() {
    repository = MockDuelGameRepository();
    repository1 = MockRankingRepository();

    sut = ResultCubit(
        rankingRepository: repository1, duelGameRepository: repository);
  });
  group("resetGameStatus", () {
    test("should call rankingRepository.resetGameStatus once", () async {
      when(
        () => repository.resetGameStatus(
          playerId: "1",
          roomId: "1",
          status: true,
          points: 1,
        ),
      ).thenAnswer((_) async => []);
      await sut.resetGameStatus(
          playerId: "1", roomId: "1", status: true, points: 1);

      verify(
        () => repository.resetGameStatus(
            playerId: "1", roomId: "1", status: true, points: 1),
      ).called(1);
    });
  });

  group("updateRanking", () {
    test("should call rankingRepository.updateRanking once", () async {
      when(
        () => repository1.updateRanking(points: 1, id: "1"),
      ).thenAnswer((_) async => []);
      await sut.updateRanking(points: 1, profileId: "1");

      verify(
        () => repository1.updateRanking(points: 1, id: "1"),
      ).called(1);
    });
  });
  group("addRoundResults", () {
    test("should call duelGameRepository.addRoundResults once", () async {
      when(
        () => repository.addRoundResults(
          roomId: "1",
          playerNumber: 1,
          roundNumber: 1,
          answerFive: 1,
          answerFour: 1,
          answerOne: 1,
          answerThree: 1,
          answerTwo: 1,
        ),
      ).thenAnswer((_) async => []);
      await sut.addRoundResults(
        roomId: "1",
        playerNumber: 1,
        roundNumber: 1,
        answerFive: 1,
        answerFour: 1,
        answerOne: 1,
        answerThree: 1,
        answerTwo: 1,
      );

      verify(
        () => repository.addRoundResults(
          roomId: "1",
          playerNumber: 1,
          roundNumber: 1,
          answerFive: 1,
          answerFour: 1,
          answerOne: 1,
          answerThree: 1,
          answerTwo: 1,
        ),
      ).called(1);
    });
  });
}
