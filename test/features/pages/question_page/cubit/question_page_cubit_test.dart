import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockDuelGameRepository extends Mock implements DuelGameRepository {}

void main() {
  late QuestionPageCubit sut;
  late MockQuestionRepository repository;
  late MockRankingRepository repository1;
  late MockDuelGameRepository repository2;

  setUp(() {
    repository = MockQuestionRepository();
    repository1 = MockRankingRepository();
    repository2 = MockDuelGameRepository();

    sut = QuestionPageCubit(
        duelGameRepository: repository2,
        rankingRepository: repository1,
        questionRepository: repository);
  });
  group("setEndTime", () {
    test("should call rankingRepository.setEndTime once", () async {
      when(
        () => repository1.setEndTime(playerId: "1"),
      ).thenAnswer((_) async => []);
      await sut.setEndTime(playerId: "1");

      verify(
        () => repository1.setEndTime(playerId: "1"),
      ).called(1);
    });
  });
}
