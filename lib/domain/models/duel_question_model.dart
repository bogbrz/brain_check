import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/duel_question_model.freezed.dart';

@freezed
class DuelQuestionModel with _$DuelQuestionModel {
  factory DuelQuestionModel({
    required String? question,
    required String? correctAnswer,
    required String? incorrectOne,
    required String? incorrectTwo,
    required String? incorrectThree,
    required String? difficulty,
    required String? category,
    required String? id,
    required int? roundNumber,
  }) = _DuelQuestionModel;
}
