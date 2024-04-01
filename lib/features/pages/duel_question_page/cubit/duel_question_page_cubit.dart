import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_question_page_state.dart';
part 'duel_question_page_cubit.freezed.dart';

class DuelQuestionPageCubit extends Cubit<DuelQuestionPageState> {
  DuelQuestionPageCubit(
      {required this.duelGameRepository, required this.questionRepository})
      : super(DuelQuestionPageState(
          errorMessage: null,
          firstQuestion: null,
          secondQuestion: null,
          thirdQuestion: null,
          fourthQuestion: null,
          fifthQuestion: null,
          sixthQuestion: null,
          seventhQuestion: null,
          eightQuestion: null,
          ninthQuestion: null,
          tenthQuestion: null,
          eleventhQuestion: null,
          twelvethQuestion: null,
          thirteenthQuestion: null,
          fourteenthQuestion: null,
          fifteenthQuestion: null,
          status: Status.initial,
          answersFive: [],
          answersFour: [],
          answersThree: [],
          answersTwo: [],
          answersOne: [],
          answersSix: [],
          answersSeven: [],
          answersEight: [],
          answersNine: [],
          answersTen: [],
          answersEleven: [],
          answersTwelve: [],
          answersThirteen: [],
          answersFourteen: [],
          answersFifteen: [],
        ));
  final DuelGameRepository duelGameRepository;
  final QuestionRepository questionRepository;
  StreamSubscription? streamSubscription;

  Future<void> getQfromFb(
      {required String roomId,
      required int roundNumber,
      required bool isCausal,
      required int? category,
      required String? difficulty,
      required int? questionsAmount}) async {
    emit(DuelQuestionPageState(
      errorMessage: null,
      firstQuestion: null,
      secondQuestion: null,
      thirdQuestion: null,
      fourthQuestion: null,
      fifthQuestion: null,
      sixthQuestion: null,
      seventhQuestion: null,
      eightQuestion: null,
      ninthQuestion: null,
      tenthQuestion: null,
      eleventhQuestion: null,
      twelvethQuestion: null,
      thirteenthQuestion: null,
      fourteenthQuestion: null,
      fifteenthQuestion: null,
      status: Status.loading,
      answersFive: [],
      answersFour: [],
      answersThree: [],
      answersTwo: [],
      answersOne: [],
      answersSix: [],
      answersSeven: [],
      answersEight: [],
      answersNine: [],
      answersTen: [],
      answersEleven: [],
      answersTwelve: [],
      answersThirteen: [],
      answersFourteen: [],
      answersFifteen: [],
    ));

    if (isCausal == false) {
      streamSubscription = duelGameRepository
          .getQuestionsFromFb(roomId: roomId, roundNumber: roundNumber)
          .listen((event) {
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
            sixthQuestion: null,
            seventhQuestion: null,
            eightQuestion: null,
            ninthQuestion: null,
            tenthQuestion: null,
            eleventhQuestion: null,
            twelvethQuestion: null,
            thirteenthQuestion: null,
            fourteenthQuestion: null,
            fifteenthQuestion: null,
            answersOne: answersOne,
            answersTwo: answersTwo,
            answersThree: answersThree,
            answersFour: answersFour,
            answersFive: answersFive,
            answersSix: [],
            answersSeven: [],
            answersEight: [],
            answersNine: [],
            answersTen: [],
            answersEleven: [],
            answersTwelve: [],
            answersThirteen: [],
            answersFourteen: [],
            answersFifteen: [],
          ));
        } catch (e) {
          emit(DuelQuestionPageState(
            errorMessage: e.toString(),
            firstQuestion: null,
            secondQuestion: null,
            thirdQuestion: null,
            fourthQuestion: null,
            fifthQuestion: null,
            sixthQuestion: null,
            seventhQuestion: null,
            eightQuestion: null,
            ninthQuestion: null,
            tenthQuestion: null,
            eleventhQuestion: null,
            twelvethQuestion: null,
            thirteenthQuestion: null,
            fourteenthQuestion: null,
            fifteenthQuestion: null,
            status: Status.error,
            answersFive: [],
            answersFour: [],
            answersThree: [],
            answersTwo: [],
            answersOne: [],
            answersSix: [],
            answersSeven: [],
            answersEight: [],
            answersNine: [],
            answersTen: [],
            answersEleven: [],
            answersTwelve: [],
            answersThirteen: [],
            answersFourteen: [],
            answersFifteen: [],
          ));
        }
      });
    } else if (isCausal) {
      final questionsList = await questionRepository.getListOfQuestions(
        category: category,
        difficulty: difficulty,
        amount: questionsAmount,
      );

      List<String> answersOne = [];
      answersOne.add(questionsList[0].correctAnswer);
      answersOne.addAll(questionsList[0].incorrectAnswers);
      answersOne.shuffle();
      List<String> answersTwo = [];
      answersTwo.add(questionsList[1].correctAnswer);
      answersTwo.addAll(questionsList[1].incorrectAnswers);
      answersTwo.shuffle();
      List<String> answersThree = [];
      answersOne.add(questionsList[2].correctAnswer);
      answersOne.addAll(questionsList[2].incorrectAnswers);
      answersOne.shuffle();
      List<String> answersFour = [];
      answersOne.add(questionsList[3].correctAnswer);
      answersOne.addAll(questionsList[3].incorrectAnswers);
      answersOne.shuffle();
      List<String> answersFive = [];
      answersOne.add(questionsList[4].correctAnswer);
      answersOne.addAll(questionsList[4].incorrectAnswers);
      answersOne.shuffle();
      List<String> answersSix = [];
      answersSix.add(questionsList[5].correctAnswer);
      answersSix.addAll(questionsList[5].incorrectAnswers);
      answersSix.shuffle();
      List<String> answersSeven = [];
      answersSeven.add(questionsList[6].correctAnswer);
      answersSeven.addAll(questionsList[6].incorrectAnswers);
      answersSeven.shuffle();

      List<String> answersEight = [];
      answersEight.add(questionsList[7].correctAnswer);
      answersEight.addAll(questionsList[7].incorrectAnswers);
      answersEight.shuffle();

      List<String> answersNine = [];
      answersNine.add(questionsList[8].correctAnswer);
      answersNine.addAll(questionsList[8].incorrectAnswers);
      answersNine.shuffle();

      List<String> answersTen = [];
      answersTen.add(questionsList[9].correctAnswer);
      answersTen.addAll(questionsList[9].incorrectAnswers);
      answersTen.shuffle();

      List<String> answersEleven = [];
      answersEleven.add(questionsList[10].correctAnswer);
      answersEleven.addAll(questionsList[10].incorrectAnswers);
      answersEleven.shuffle();

      List<String> answersTwelve = [];
      answersTwelve.add(questionsList[11].correctAnswer);
      answersTwelve.addAll(questionsList[11].incorrectAnswers);
      answersTwelve.shuffle();

      List<String> answersThirteen = [];
      answersThirteen.add(questionsList[12].correctAnswer);
      answersThirteen.addAll(questionsList[12].incorrectAnswers);
      answersThirteen.shuffle();

      List<String> answersFourteen = [];
      answersFourteen.add(questionsList[13].correctAnswer);
      answersFourteen.addAll(questionsList[13].incorrectAnswers);
      answersFourteen.shuffle();

      List<String> answersFifteen = [];
      answersFifteen.add(questionsList[14].correctAnswer);
      answersFifteen.addAll(questionsList[14].incorrectAnswers);
      answersFifteen.shuffle();

      List<DuelQuestionModel> questionModelList = questionsList
          .map((e) => DuelQuestionModel(
              question: e.question,
              correctAnswer: e.correctAnswer,
              incorrectOne: e.incorrectAnswers[0],
              incorrectTwo: e.incorrectAnswers[1],
              incorrectThree: e.incorrectAnswers[2],
              difficulty: e.difficulty,
              category: e.category,
              id: null,
              roundNumber: roundNumber))
          .toList();

      try {
        emit(DuelQuestionPageState(
            errorMessage: null,
            firstQuestion: questionModelList[0],
            secondQuestion: questionModelList[1],
            thirdQuestion: questionModelList[2],
            fourthQuestion: questionModelList[3],
            fifthQuestion: questionModelList[4],
            sixthQuestion: questionModelList[5],
            seventhQuestion: questionModelList[6],
            eightQuestion: questionModelList[7],
            ninthQuestion: questionModelList[8],
            tenthQuestion: questionModelList[9],
            eleventhQuestion: questionModelList[10],
            twelvethQuestion: questionModelList[11],
            thirteenthQuestion: questionModelList[12],
            fourteenthQuestion: questionModelList[13],
            fifteenthQuestion: questionModelList[14],
            status: Status.success,
            answersOne: answersOne,
            answersTwo: answersTwo,
            answersThree: answersThree,
            answersFour: answersFour,
            answersFive: answersFive,
            answersSix: answersSix,
            answersSeven: answersSeven,
            answersEight: answersEight,
            answersNine: answersNine,
            answersTen: answersTen,
            answersEleven: answersEleven,
            answersTwelve: answersTwelve,
            answersThirteen: answersThirteen,
            answersFourteen: answersFourteen,
            answersFifteen: answersFifteen));
      } catch (e) {

        emit(DuelQuestionPageState(
            errorMessage: e.toString(),
            firstQuestion: null,
            secondQuestion: null,
            thirdQuestion: null,
            fourthQuestion: null,
            fifthQuestion: null,
            sixthQuestion: null,
            seventhQuestion: null,
            eightQuestion: null,
            ninthQuestion: null,
            tenthQuestion: null,
            eleventhQuestion: null,
            twelvethQuestion: null,
            thirteenthQuestion: null,
            fourteenthQuestion: null,
            fifteenthQuestion: null,
            status: Status.error,
            answersFive: [],
            answersFour: [],
            answersThree: [],
            answersTwo: [],
            answersOne: [],
            answersSix: [],
            answersSeven: [],
            answersEight: [],
            answersNine: [],
            answersTen: [],
            answersEleven: [],
            answersTwelve: [],
            answersThirteen: [],
            answersFourteen: [],
            answersFifteen: [],
          ));
      }
    }
  }
}
