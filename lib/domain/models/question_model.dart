// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class Questions with _$Questions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Questions({
    required int responseCode,
    required List<QuestionModel> results,
  }) = _Questions;

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {
  
  const QuestionModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory QuestionModel({
    required String? type,
    required String? difficulty,
    required String? category,
    required String question,
    required String correctAnswer,
    required List<String> incorrectAnswers,
  }) = _QuestionModel;
  
  // List<String> get answers {
  //   List<String> answers = [];
  //   answers.addAll(incorrectAnswers);
  //   answers.add(correctAnswer);
  //   answers.shuffle();
    
  //   return answers;
  // }

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
