import 'package:brain_check/app/data_sources/questions_data_source.dart';
import 'package:brain_check/app/domain/models/categories_model.dart';
import 'package:brain_check/app/domain/models/question_model.dart';

class QuestionRepository {
  QuestionRepository({required this.questionDataSource});
  final QuestionDataSource questionDataSource;

  Future<List<QuestionModel>> getQuestion(
      {required int? category, required String? difficulty}) async {
    return questionDataSource.getQuestionWithCatAndDiff(difficulty, category);
  }

  Future<List<TriviaCategory>> getCategories() async {
    final json = await questionDataSource.getCategories();
    print(json);
    return json;
  }
}
