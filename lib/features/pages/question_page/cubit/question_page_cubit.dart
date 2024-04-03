import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
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
          firstQuestion: null,
          secondQuestion: null,
          thirdQuestion: null,
          fourthQuestion: null,
          fifthQuestion: null,
          errorMessage: null,
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

  final QuestionRepository questionRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getQuestion({
    required int category,
    required String difficulty,
    required int questionsAmount,
  }) async {
    emit(QuestionPageState(
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
      errorMessage: null,
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
    print("DUPA");
    final questionList = await questionRepository.getListOfQuestions(
        category: category, difficulty: difficulty, amount: 15);
    List<String> answersOne = [];

    answersOne.add(questionList[0].correctAnswer.toString());
    answersOne.addAll(questionList[0].incorrectAnswers);

    answersOne.shuffle();

    List<String> answersTwo = [];

    answersTwo.add(questionList[1].correctAnswer.toString());
    answersTwo.addAll(questionList[1].incorrectAnswers);

    answersTwo.shuffle();

    List<String> answersThree = [];

    answersThree.add(questionList[2].correctAnswer.toString());
    answersThree.addAll(questionList[2].incorrectAnswers);

    answersThree.shuffle();

    List<String> answersFour = [];

    answersFour.add(questionList[3].correctAnswer.toString());
    answersFour.addAll(questionList[3].incorrectAnswers);

    answersFour.shuffle();

    List<String> answersFive = [];

    answersFive.add(questionList[4].correctAnswer.toString());
    answersFive.addAll(questionList[4].incorrectAnswers);

    answersFive.shuffle();
    List<String> answersSix = [];
    answersSix.add(questionList[5].correctAnswer);
    answersSix.addAll(questionList[5].incorrectAnswers);
    answersSix.shuffle();
    List<String> answersSeven = [];
    answersSeven.add(questionList[6].correctAnswer);
    answersSeven.addAll(questionList[6].incorrectAnswers);
    answersSeven.shuffle();

    List<String> answersEight = [];
    answersEight.add(questionList[7].correctAnswer);
    answersEight.addAll(questionList[7].incorrectAnswers);
    answersEight.shuffle();

    List<String> answersNine = [];
    answersNine.add(questionList[8].correctAnswer);
    answersNine.addAll(questionList[8].incorrectAnswers);
    answersNine.shuffle();

    List<String> answersTen = [];
    answersTen.add(questionList[9].correctAnswer);
    answersTen.addAll(questionList[9].incorrectAnswers);
    answersTen.shuffle();

    List<String> answersEleven = [];
    answersEleven.add(questionList[10].correctAnswer);
    answersEleven.addAll(questionList[10].incorrectAnswers);
    answersEleven.shuffle();

    List<String> answersTwelve = [];
    answersTwelve.add(questionList[11].correctAnswer);
    answersTwelve.addAll(questionList[11].incorrectAnswers);
    answersTwelve.shuffle();

    List<String> answersThirteen = [];
    answersThirteen.add(questionList[12].correctAnswer);
    answersThirteen.addAll(questionList[12].incorrectAnswers);
    answersThirteen.shuffle();

    List<String> answersFourteen = [];
    answersFourteen.add(questionList[13].correctAnswer);
    answersFourteen.addAll(questionList[13].incorrectAnswers);
    answersFourteen.shuffle();

    List<String> answersFifteen = [];
    answersFifteen.add(questionList[14].correctAnswer);
    answersFifteen.addAll(questionList[14].incorrectAnswers);
    answersFifteen.shuffle();

    try {
      emit(QuestionPageState(
        errorMessage: null,
        firstQuestion: questionList[0],
        secondQuestion: questionList[1],
        thirdQuestion: questionList[2],
        fourthQuestion: questionList[3],
        fifthQuestion: questionList[4],
        sixthQuestion: questionList[5],
        seventhQuestion: questionList[6],
        eightQuestion: questionList[7],
        ninthQuestion: questionList[8],
        tenthQuestion: questionList[9],
        eleventhQuestion: questionList[10],
        twelvethQuestion: questionList[11],
        thirteenthQuestion: questionList[12],
        fourteenthQuestion: questionList[13],
        fifteenthQuestion: questionList[14],
        status: Status.success,
        answersFive: answersFive,
        answersFour: answersFour,
        answersThree: answersThree,
        answersTwo: answersTwo,
        answersOne: answersOne,
        answersSix: answersSix,
        answersSeven: answersSeven,
        answersEight: answersEight,
        answersNine: answersNine,
        answersTen: answersTen,
        answersEleven: answersEleven,
        answersTwelve: answersTwelve,
        answersThirteen: answersThirteen,
        answersFourteen: answersFourteen,
        answersFifteen: answersFifteen,
      ));
    } catch (e) {
      emit(QuestionPageState(
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

    @override
    Future<void> close() {
      streamSubscription?.cancel();
      return super.close();
    }
  }
}
