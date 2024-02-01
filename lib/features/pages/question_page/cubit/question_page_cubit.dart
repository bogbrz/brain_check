import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_page_state.dart';
part 'question_page_cubit.freezed.dart';

class QuestionPageCubit extends Cubit<QuestionPageState> {
  QuestionPageCubit(
      {required this.questionRepository, required this.rankingRepository})
      : super(QuestionPageState(
          answers: [],
          errorMessage: null,
          questions: [],
        ));

  final QuestionRepository questionRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;


  Future<void> getQuestion({
    required int? category,
    required String? difficulty,
  }) async {
    if (difficulty == null.toString()) {
      difficulty = null;
    }
    if (category == 0) {
      category = null;
    }
    List<String> answers = [];
    final questionContent = await questionRepository.getQuestion(
        category: category, difficulty: difficulty);
    answers.addAll(questionContent[0].incorrectAnswers);
    answers.add(questionContent[0].correctAnswer);
    answers.shuffle();
   
    try {
      emit(QuestionPageState(
        answers: answers,
        errorMessage: null,
        questions: questionContent,
      ));
    } catch (error) {
      emit(QuestionPageState(
        answers: [],
        errorMessage: error.toString(),
        questions: [],
      ));
    }
  }

  Future<void> getFiveQuestions(
      {required int category,
      required String difficulty,
      required int index,
      required int amount}) async {
    final questionContent = await questionRepository.getListOfQuestions(
        category: category, difficulty: difficulty, amount: amount);
    final List<String> answers = [];
    answers.addAll(questionContent[index].incorrectAnswers);
    answers.add(questionContent[index].correctAnswer);
    answers.shuffle();

    try {
      emit(QuestionPageState(
        answers: answers,
        errorMessage: null,
        questions: questionContent,
      ));
    } catch (error) {
      emit(QuestionPageState(
        answers: [],
        errorMessage: error.toString(),
        questions: [],
      ));
    }
  }

  Future<void> getMockQuestions(
      {required String difficulty,
      required int category,
      required int index}) async {
    final List<String> answers = [];
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
    answers.addAll(mockList[index].incorrectAnswers);
    answers.add(mockList[index].correctAnswer);
    answers.shuffle();
    emit(QuestionPageState(
      answers: answers,
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
