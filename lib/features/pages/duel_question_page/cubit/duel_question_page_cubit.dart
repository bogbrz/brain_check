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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
          roundNumber: null,
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
          roundNumber: null,
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
          roundNumber: null,
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
          roundNumber: null,
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
          roundNumber: null,
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
      ;
      List<String> answersOne = [];
      if (event[0].incorrectTwo == null) {
        answersOne.add(event[0].correctAnswer.toString());
        answersOne.add(event[0].incorrectOne.toString());

        answersOne.shuffle();
      } else {
        answersOne.add(event[0].correctAnswer.toString());
        answersOne.add(event[0].incorrectOne.toString());
        answersOne.add(event[0].incorrectTwo.toString());
        answersOne.add(event[0].incorrectThree.toString());
        answersOne.shuffle();
      }

      List<String> answersTwo = [];
      if (event[1].incorrectTwo == null) {
        answersTwo.add(event[1].correctAnswer.toString());
        answersTwo.add(event[1].incorrectOne.toString());

        answersTwo.shuffle();
      } else {
        answersTwo.add(event[1].correctAnswer.toString());
        answersTwo.add(event[1].incorrectOne.toString());
        answersTwo.add(event[1].incorrectTwo.toString());
        answersTwo.add(event[1].incorrectThree.toString());
        answersTwo.shuffle();
      }

      List<String> answersThree = [];
      if (event[2].incorrectTwo == null) {
        answersThree.add(event[2].correctAnswer.toString());
        answersThree.add(event[2].incorrectOne.toString());

        answersThree.shuffle();
      } else {
        answersThree.add(event[2].correctAnswer.toString());
        answersThree.add(event[2].incorrectOne.toString());
        answersThree.add(event[2].incorrectTwo.toString());
        answersThree.add(event[2].incorrectThree.toString());
        answersThree.shuffle();
      }

      List<String> answersFour = [];
      if (event[3].incorrectTwo == null) {
        answersFour.add(event[3].correctAnswer.toString());
        answersFour.add(event[3].incorrectOne.toString());

        answersFour.shuffle();
      } else {
        answersFour.add(event[3].correctAnswer.toString());
        answersFour.add(event[3].incorrectOne.toString());
        answersFour.add(event[3].incorrectTwo.toString());
        answersFour.add(event[3].incorrectThree.toString());
        answersFour.shuffle();
      }

      List<String> answersFive = [];
      if (event[4].incorrectTwo == null) {
        answersFive.add(event[4].correctAnswer.toString());
        answersFive.add(event[4].incorrectOne.toString());

        answersFive.shuffle();
      } else {
        answersFive.add(event[4].correctAnswer.toString());
        answersFive.add(event[4].incorrectOne.toString());
        answersFive.add(event[4].incorrectTwo.toString());
        answersFive.add(event[4].incorrectThree.toString());
        answersFive.shuffle();
      }

      try {
        print(
            "Q FROM BASE  1${event[0]}, 2${event[1]}, 3${event[2]}, 4${event[3]}, 5${event[4]} ");
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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
              roundNumber: null,
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
}
