import 'package:bloc_test/bloc_test.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

void main() {
  late CategoriesPageCubit sut;
  late MockQuestionRepository repository;
  setUp(() {
    repository = MockQuestionRepository();
    sut = CategoriesPageCubit(questionRepository: repository);
  });

  group("getCategories", () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.getCategories(),
        ).thenAnswer((_) async => [TriviaCategory(id: 1, name: "name")]);
      });
      blocTest<CategoriesPageCubit, CategoriesPageState>(
        'emits Status.loading then succses with categories.',
        build: () => sut,
        act: (cubit) => cubit.getCategories(),
        expect: () => <CategoriesPageState>[
          CategoriesPageState(
              errorMessage: null, categories: [], status: Status.loading),
          CategoriesPageState(
              errorMessage: null,
              categories: [TriviaCategory(id: 1, name: "name")],
              status: Status.success)
        ],
      );
    });
    group("faliure", () {
      setUp(() {
        when(
          () => repository.getCategories(),
        ).thenThrow("Exception: Error");
      });
      blocTest<CategoriesPageCubit, CategoriesPageState>(
        'emits Status.loading then error with exception.',
        build: () => sut,
        act: (cubit) => cubit.getCategories(),
        expect: () => <CategoriesPageState>[
          CategoriesPageState(
              errorMessage: null, categories: [], status: Status.loading),
          CategoriesPageState(
              errorMessage: "Exception: Error",
              categories: [],
              status: Status.error)
        ],
      );
    });
  });
}
