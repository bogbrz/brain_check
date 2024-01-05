import 'package:brain_check/app/data_sources/questions_data_source.dart';
import 'package:brain_check/app/domain/models/categories_model.dart';

import 'package:brain_check/app/domain/models/question_model.dart';

class QuestionRepository {
  QuestionRepository({required this.questionDataSource});
  final QuestionDataSource questionDataSource;

  Future<QuestionModel> getQuestion(
      {required int category, required String difficulty}) async {
    final question = await questionDataSource.getQuestionWithCatAndDiff(
        difficulty, category);
    return question;
  }

  Future<List<TriviaCategory>> getCategories() async {
    final categoryList = await questionDataSource.getCategories();
    print("REPOSITORY PRINT   ${categoryList}");
    final categories = categoryList.triviaCategories;

    return categories;
  }
}
