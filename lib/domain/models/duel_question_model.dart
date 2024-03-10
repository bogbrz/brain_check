import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'duel_question_model.freezed.dart';

@freezed
class DuelQuestionModel with _$DuelQuestionModel {
  const DuelQuestionModel._();
  factory DuelQuestionModel({
    required String? question,
    required String? correctAnswer,
    required String? incorrectOne,
    required String? incorrectTwo,
    required String? incorrectThree,
    required String? difficulty,
    required String? category,
    required String? id,
  }) = _DuelQuestionModel;

  List<String?> get answers {
    List<String?> listOfAnswers = [];
    listOfAnswers.add(correctAnswer);
    listOfAnswers.add(incorrectOne);
    listOfAnswers.add(incorrectTwo);

    listOfAnswers.add(incorrectThree);
    listOfAnswers.shuffle();

    return listOfAnswers;
  }
}
