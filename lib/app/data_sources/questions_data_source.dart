import 'package:brain_check/app/domain/models/question_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'questions_data_source.g.dart';

@RestApi(baseUrl: 'https://opentdb.com/')
abstract class QuestionDataSource {
  factory QuestionDataSource(Dio dio, {String baseUrl}) = _QuestionDataSource;

  @GET('/api.php?amount=1')
  Future<List<QuestionModel>> getTasks(
      @Query("difficulty") String difficulty, @Query("category") int category);
}
