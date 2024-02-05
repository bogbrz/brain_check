import 'package:brain_check/data_sources/questions_data_source.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/question_model.dart';

class QuestionRepository {
  QuestionRepository({required this.questionDataSource});
  final QuestionDataSource questionDataSource;

  Future<List<QuestionModel>> getQuestion(
      {required int? category, required String? difficulty}) async {
    final questions = await questionDataSource.getQuestionWithCatAndDiff(
        difficulty, category);
    final questionContent = questions.results;
    return questionContent;
  }

  Future<List<QuestionModel>> getListOfQuestions(
      {required int? category, required String? difficulty, required int? amount}) async {
    final questions =
        await questionDataSource.getListofQuestions(difficulty, category, amount);
  
    return questions.results;
  }

  Future<List<TriviaCategory>> getCategories() async {
    final categoryList = await questionDataSource.getCategories();

    final categories = categoryList.triviaCategories;

    return categories;
  }
}
