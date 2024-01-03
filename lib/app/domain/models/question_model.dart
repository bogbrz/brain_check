import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_model.g.dart';
part 'question_model.freezed.dart';

@freezed
class QuestionModel with _$QuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory QuestionModel({
    required String question,
    required String correctAnswer,
    required List<String> incorrectAnswers,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
