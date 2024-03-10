import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_question_page_state.dart';
part 'duel_question_page_cubit.freezed.dart';

class DuelQuestionPageCubit extends Cubit<DuelQuestionPageState> {
  DuelQuestionPageCubit({
    required this.duelGameRepository,
  }) : super(DuelQuestionPageState(
            firstQuestion: DuelQuestionModel(
                question: null,
                correctAnswer: null,
                incorrectOne: null,
                incorrectTwo: null,
                incorrectThree: null,
                difficulty: null,
                category: null,
                id: null),
            secondQuestion: DuelQuestionModel(
                question: null,
                correctAnswer: null,
                incorrectOne: null,
                incorrectTwo: null,
                incorrectThree: null,
                difficulty: null,
                category: null,
                id: null),
            thirdQuestion: DuelQuestionModel(
                question: null,
                correctAnswer: null,
                incorrectOne: null,
                incorrectTwo: null,
                incorrectThree: null,
                difficulty: null,
                category: null,
                id: null),
            fourthQuestion: DuelQuestionModel(
                question: null,
                correctAnswer: null,
                incorrectOne: null,
                incorrectTwo: null,
                incorrectThree: null,
                difficulty: null,
                category: null,
                id: null),
            fifthQuestion: DuelQuestionModel(
                question: null,
                correctAnswer: null,
                incorrectOne: null,
                incorrectTwo: null,
                incorrectThree: null,
                difficulty: null,
                category: null,
                id: null),
            errorMessage: null,
            status: Status.initial));
  final DuelGameRepository duelGameRepository;

  Future<void> getQfromFb({required String roomId}) async {
    emit(DuelQuestionPageState(
        errorMessage: null,
        firstQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        secondQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        thirdQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        fourthQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        fifthQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        status: Status.loading));
    duelGameRepository.getQuestionsFromFb(roomId: roomId).listen((event) {
      try {
        emit(DuelQuestionPageState(
            errorMessage: null,
            status: Status.success,
            firstQuestion: event[0],
            secondQuestion: event[1],
            thirdQuestion: event[2],
            fourthQuestion: event[3],
            fifthQuestion: event[4]));
      } catch (e) {
        emit(DuelQuestionPageState(
            errorMessage: e.toString(), firstQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        secondQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        thirdQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        fourthQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null),
        fifthQuestion: DuelQuestionModel(
            question: null,
            correctAnswer: null,
            incorrectOne: null,
            incorrectTwo: null,
            incorrectThree: null,
            difficulty: null,
            category: null,
            id: null), status: Status.error));
      }
    });
  }
}
