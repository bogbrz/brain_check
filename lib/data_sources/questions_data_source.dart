import 'package:brain_check/domain/models/categories_info_model.dart';
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/models/token_model.dart';
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
    @Query("difficulty") String? difficulty,
    @Query("category") int? category,
    @Query("token") String? token,
  );

  @GET('/api.php')
  Future<Questions> getListofQuestions(
      @Query("difficulty") String? difficulty,
      @Query("category") int? category,
      @Query("amount") int? amount,
      );

  @GET("/api_category.php/")
  Future<CategoryModel> getCategories();

  @GET("/api_count_global.php")
  Future<Welcome> getOverallInfo();

  @GET("/api_count_global.php")
  Future<WelcomeCategory> getCategoriesInfo(@Query("category") int category);

  @GET("/api_token.php?command=request")
  Future<TokenModel> getToken();
}
