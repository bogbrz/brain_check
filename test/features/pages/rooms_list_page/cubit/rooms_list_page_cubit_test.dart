import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_cubit.dart';
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

class MockDuelGameRepository extends Mock implements DuelGameRepository {}

void main() {
  late RoomsListPageCubit sut;
  late MockDuelGameRepository repository;

  setUp(() {
    repository = MockDuelGameRepository();

    sut = RoomsListPageCubit(duelGameRepository: repository);
  });
  group("createRoom", () {
    test("should call duelGameRepository.createRoom once", () async {
      when(
        () => repository.createRoom(name: "1", password: "1", nickName: "1"),
      ).thenAnswer((_) async => []);
      await sut.createRoom(name: "1", password: "1", nickName: "1");

      verify(
        () => repository.createRoom(name: "1", password: "1", nickName: "1"),
      ).called(1);
    });
  });
}
