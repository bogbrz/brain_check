import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_test_state.dart';
part 'question_test_cubit.freezed.dart';

class QuestionTestPageCubit extends Cubit<QuestionTestPageState> {
  QuestionTestPageCubit(
      {required this.questionRepository, required this.rankingRepository})
      : super(QuestionTestPageState(
          status: Status.initial,
          errorMessage: null,
          questions: [],
        ));

  final QuestionRepository questionRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getListOfQuestions(
      {required int category,
      required String difficulty,
      required int amount}) async {
    emit(QuestionTestPageState(
        errorMessage: null, questions: [], status: Status.loading));

    try {
      final list = await questionRepository.getListOfQuestions(
          category: category, difficulty: difficulty, amount: amount);
      if (list == []) {}
      print("QUESTIONS LIST $list");
      emit(QuestionTestPageState(
          errorMessage: null, questions: list, status: Status.success));
    } catch (error) {
      emit(QuestionTestPageState(
          errorMessage: error.toString(), questions: [], status: Status.error));
    }
  }

  Future<void> getMockQuestions({
    required String difficulty,
    required int category,
  }) async {
    emit(QuestionTestPageState(
        errorMessage: null, questions: [], status: Status.loading));

    final List<QuestionModel> mockList = [
      QuestionModel(
          type: "type",
          difficulty: "difficulty",
          category: "category",
          question: "quesiton1",
          correctAnswer: "correctAnswer1",
          incorrectAnswers: ["11", "1,2", "1,3"]),
      QuestionModel(
          type: "type",
          difficulty: "difficulty",
          category: "category",
          question: "quesiton2",
          correctAnswer: "correctAnswer2",
          incorrectAnswers: ["21", "22", "23"]),
      QuestionModel(
          type: "type",
          difficulty: "difficulty",
          category: "category",
          question: "quesiton3",
          correctAnswer: "correctAnswer3",
          incorrectAnswers: ["31", "32", "33"]),
      QuestionModel(
          type: "type",
          difficulty: "difficulty",
          category: "category",
          question: "quesiton4",
          correctAnswer: "correctAnswer4",
          incorrectAnswers: ["41", "42", "43"]),
      QuestionModel(
          type: "type",
          difficulty: "difficulty",
          category: "category",
          question: "quesiton5",
          correctAnswer: "correctAnswer5",
          incorrectAnswers: ["51", "52", "53"]),
    ];

    emit(QuestionTestPageState(
      status: Status.success,
      errorMessage: null,
      questions: mockList,
    ));
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
