
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:dio/dio.dart';


import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';
part 'questions_data_source.g.dart';

@injectable


@RestApi()
abstract class QuestionDataSource {
  @factoryMethod
  factory QuestionDataSource(
    Dio dio,
  ) = _QuestionDataSource;

  @GET('/api.php?amount=1')
  Future<Questions> getQuestionWithCatAndDiff(
      @Query("difficulty") String? difficulty, @Query("category") int? category);

 @GET('/api.php')
  Future<Questions> getListofQuestions(
      @Query("difficulty") String? difficulty, @Query("category") int? category, @Query("amount") int? amount);

  // @GET('/api.php?amount=5')
  // Future<List<QuestionModel>> getQuestionWithCat(
  //     @Query("category") int? category);
  @GET("/api_category.php/")
  Future<CategoryModel> getCategories();
}
