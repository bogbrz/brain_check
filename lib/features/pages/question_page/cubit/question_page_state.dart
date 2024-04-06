part of 'question_page_cubit.dart';

@freezed
class QuestionPageState with _$QuestionPageState {
  factory QuestionPageState({
     required String? errorMessage,
    required QuestionModel? firstQuestion,
    required QuestionModel? secondQuestion,
    required QuestionModel? thirdQuestion,
    required QuestionModel? fourthQuestion,
    required QuestionModel? fifthQuestion,
       required QuestionModel? sixthQuestion,
    required QuestionModel? seventhQuestion,
    required QuestionModel? eightQuestion,
    required QuestionModel? ninthQuestion,
    required QuestionModel? tenthQuestion,
     required QuestionModel? eleventhQuestion,
    required QuestionModel? twelvethQuestion,
    required QuestionModel? thirteenthQuestion,
    required QuestionModel? fourteenthQuestion,
    required QuestionModel? fifteenthQuestion,
   
  
    required Status status,
    required List<String?>? answersOne,
    required List<String?>? answersTwo,
    required List<String?>? answersThree,
    required List<String?>? answersFour,
    required List<String?>? answersFive,
     required List<String?>? answersSix,
    required List<String?>? answersSeven,
    required List<String?>? answersEight,
    required List<String?>? answersNine,
    required List<String?>? answersTen,
    required List<String?>? answersEleven,
    required List<String?>? answersTwelve,
    required List<String?>? answersThirteen,
    required List<String?>? answersFourteen,
    required List<String?>? answersFifteen,
  }) = _QuestionPageState;
}