import 'package:brain_check/data_sources/questions_data_source.dart';
import 'package:brain_check/domain/models/categories_info_model.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/models/token_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionDataSource extends Mock implements QuestionDataSource {}

void main() {
  late QuestionRepository sut;
  late MockQuestionDataSource dataSource;

  setUp(() {
    dataSource = MockQuestionDataSource();
    sut = QuestionRepository(questionDataSource: dataSource);
  });

  group("fetchToken", () {
    test("should call questionDataSource.fetchToken() method once", () async {
      when(() => dataSource.getToken()).thenAnswer((_) async => TokenModel(
          response: 1, responeMessage: "responeMessage", token: "token"));

      await sut.fetchToken();

      verify(
        () => dataSource.getToken(),
      ).called(1);
    });
  });
  group("getQuesiton", () {
    test("should call questionDataSource.getQuestion() method once", () async {
      when(() => dataSource.getQuestionWithCatAndDiff("easy", 9, "1"))
          .thenAnswer((_) async => Questions(responseCode: 0, results: []));

      await sut.getQuestion(category: 9, difficulty: "easy", token: "1");

      verify(
        () => dataSource.getQuestionWithCatAndDiff("easy", 9, "1"),
      ).called(1);
    });
  });
  group("getListOfQuesiton", () {
    test("should call questionDataSource.getListOfQuestions() method once",
        () async {
      when(() => dataSource.getToken()).thenAnswer((_) async => TokenModel(
          response: 1, responeMessage: "responeMessage", token: "1"));
      when(() => dataSource.getListofQuestions("easy", 9, 1, "1"))
          .thenAnswer((_) async => Questions(responseCode: 0, results: []));

      await sut.getListOfQuestions(category: 9, difficulty: "easy", amount: 1);

      verify(
        () => dataSource.getListofQuestions("easy", 9, 1, "1"),
      ).called(1);
      verify(
        () => dataSource.getToken(),
      ).called(1);
    });
  });
  group("getCategories", () {
    test("should call questionDataSource.getCategories() method once",
        () async {
      when(() => dataSource.getCategories())
          .thenAnswer((_) async => CategoryModel(triviaCategories: []));

      await sut.getCategories();

      verify(
        () => dataSource.getCategories(),
      ).called(1);
    });
  });
  group("getCategoryInfo", () {
    test("should call questionDataSource.getCategoryInfo() method once",
        () async {
      when(() => dataSource.getCategoriesInfo(9)).thenAnswer((_) async =>
          WelcomeCategory(
              categoryId: 9,
              categoryQuestionCount: CategoryQuestionCount(
                  totalQuestionCount: 1,
                  totalEasyQuestionCount: 1,
                  totalMediumQuestionCount: 1,
                  totalHardQuestionCount: 1)));

      await sut.getCategoryInfo(category: 9);

      verify(
        () => dataSource.getCategoriesInfo(9),
      ).called(1);
    });
  });
  group("getOverAllInfo", () {
    test("should call questionDataSource.getOverallInfo() method once",
        () async {
      when(() => dataSource.getOverallInfo()).thenAnswer((_) async => Welcome(
          overall: Overall(
              totalNumOfQuestions: 1,
              totalNumOfPendingQuestions: 1,
              totalNumOfVerifiedQuestions: 1,
              totalNumOfRejectedQuestions: 1),
          categories: {}));

      await sut.getOverAllInfo();

      verify(
        () => dataSource.getOverallInfo(),
      ).called(1);
    });
  });
}
