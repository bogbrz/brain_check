import 'package:bloc_test/bloc_test.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/categories_info_model.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockRankingRepository extends Mock implements RankingRepository {}

void main() {
  late DifficultyPageCubit sut;
  late MockQuestionRepository repository1;
  late MockRankingRepository repository2;
  setUp(() {
    repository1 = MockQuestionRepository();
    repository2 = MockRankingRepository();
    sut = DifficultyPageCubit(
        questionRepository: repository1, rankingRepository: repository2);
  });

  group("setStartTime", () {
    test("should call rankingRepository.setStartTime once", () async {
      when(
        () => repository2.setStartTime(playerId: "playerId"),
      ).thenAnswer((_) async => []);
      await sut.setStartTime(playerId: "playerId");
      verify(
        () => repository2.setStartTime(playerId: "playerId"),
      ).called(1);
    });
  });

  group("getCategoryInfo", () {
    group("succes", () {
      setUp(() {
        when(
          () => repository1.getCategoryInfo(category: 0),
        ).thenAnswer((_) async => CategoryQuestionCount(
            totalQuestionCount: 1,
            totalEasyQuestionCount: 1,
            totalMediumQuestionCount: 1,
            totalHardQuestionCount: 1));
        when(
          () => repository1.getOverAllInfo(),
        ).thenAnswer((_) async => Overall(
            totalNumOfQuestions: 1,
            totalNumOfPendingQuestions: 1,
            totalNumOfVerifiedQuestions: 1,
            totalNumOfRejectedQuestions: 1));
      });
      blocTest<DifficultyPageCubit, DifficultyPageState>(
        'emits Status.loading then succses',
        build: () => sut,
        act: (cubit) => cubit.getCategoryInfo(category: 0),
        expect: () => [
          isA<DifficultyPageState>()
              .having((p0) => p0.status, "status", Status.loading),
          isA<DifficultyPageState>()
              .having((p0) => p0.status, "status", Status.success)
        ],
      );
    });
    group("error", () {
      setUp(() {
        when(
          () => repository1.getCategoryInfo(category: 0),
        ).thenThrow((_) async => "error");
        when(
          () => repository1.getOverAllInfo(),
        ).thenThrow((_) async => "error");
      });
      blocTest<DifficultyPageCubit, DifficultyPageState>(
        'emits Status.loading then error',
        build: () => sut,
        act: (cubit) => cubit.getCategoryInfo(category: 0),
        expect: () => [
          isA<DifficultyPageState>()
              .having((p0) => p0.status, "status", Status.loading),
          isA<DifficultyPageState>()
              .having((p0) => p0.status, "status", Status.error)
        ],
      );
    });
  });
}
