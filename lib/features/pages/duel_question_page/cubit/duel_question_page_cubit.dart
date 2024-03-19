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
              id: null,
            ),
            secondQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            thirdQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            fourthQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            fifthQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            errorMessage: null,
            status: Status.initial,
            answersFive: [],
            answersFour: [],
            answersThree: [],
            answersTwo: [],
            answersOne: []));
  final DuelGameRepository duelGameRepository;
  StreamSubscription? streamSubscription;

  Future<void> getQfromFb(
      {required String roomId, required int roundNumber}) async {
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
          id: null,
        ),
        secondQuestion: DuelQuestionModel(
          question: null,
          correctAnswer: null,
          incorrectOne: null,
          incorrectTwo: null,
          incorrectThree: null,
          difficulty: null,
          category: null,
          id: null,
        ),
        thirdQuestion: DuelQuestionModel(
          question: null,
          correctAnswer: null,
          incorrectOne: null,
          incorrectTwo: null,
          incorrectThree: null,
          difficulty: null,
          category: null,
          id: null,
        ),
        fourthQuestion: DuelQuestionModel(
          question: null,
          correctAnswer: null,
          incorrectOne: null,
          incorrectTwo: null,
          incorrectThree: null,
          difficulty: null,
          category: null,
          id: null,
        ),
        fifthQuestion: DuelQuestionModel(
          question: null,
          correctAnswer: null,
          incorrectOne: null,
          incorrectTwo: null,
          incorrectThree: null,
          difficulty: null,
          category: null,
          id: null,
        ),
        status: Status.loading,
        answersFive: [],
        answersFour: [],
        answersThree: [],
        answersTwo: [],
        answersOne: []));
    streamSubscription = duelGameRepository
        .getQuestionsFromFb(roomId: roomId, roundNumber: roundNumber)
        .listen((event) {
      List<String> answersOne = [];
      answersOne.add(event[0].correctAnswer.toString());
      answersOne.add(event[0].incorrectOne.toString());
      answersOne.add(event[0].incorrectTwo.toString());
      answersOne.add(event[0].incorrectThree.toString());
      answersOne.shuffle();

      List<String> answersTwo = [];
      answersTwo.add(event[1].correctAnswer.toString());
      answersTwo.add(event[1].incorrectOne.toString());
      answersTwo.add(event[1].incorrectTwo.toString());
      answersTwo.add(event[1].incorrectThree.toString());
      answersTwo.shuffle();
      List<String> answersThree = [];
      answersThree.add(event[2].correctAnswer.toString());
      answersThree.add(event[2].incorrectOne.toString());
      answersThree.add(event[2].incorrectTwo.toString());
      answersThree.add(event[2].incorrectThree.toString());
      answersThree.shuffle();
      List<String> answersFour = [];
      answersFour.add(event[3].correctAnswer.toString());
      answersFour.add(event[3].incorrectOne.toString());
      answersFour.add(event[3].incorrectTwo.toString());
      answersFour.add(event[3].incorrectThree.toString());
      answersFour.shuffle();
      List<String> answersFive = [];
      answersFive.add(event[4].correctAnswer.toString());
      answersFive.add(event[4].incorrectOne.toString());
      answersFive.add(event[4].incorrectTwo.toString());
      answersFive.add(event[4].incorrectThree.toString());
      answersFive.shuffle();

      try {
        emit(DuelQuestionPageState(
            errorMessage: null,
            status: Status.success,
            firstQuestion: event[0],
            secondQuestion: event[1],
            thirdQuestion: event[2],
            fourthQuestion: event[3],
            fifthQuestion: event[4],
            answersOne: answersOne,
            answersTwo: answersTwo,
            answersThree: answersThree,
            answersFour: answersFour,
            answersFive: answersFive));
      } catch (e) {
        emit(DuelQuestionPageState(
            errorMessage: e.toString(),
            firstQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            secondQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            thirdQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            fourthQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            fifthQuestion: DuelQuestionModel(
              question: null,
              correctAnswer: null,
              incorrectOne: null,
              incorrectTwo: null,
              incorrectThree: null,
              difficulty: null,
              category: null,
              id: null,
            ),
            status: Status.error,
            answersFive: [],
            answersFour: [],
            answersThree: [],
            answersTwo: [],
            answersOne: []));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
