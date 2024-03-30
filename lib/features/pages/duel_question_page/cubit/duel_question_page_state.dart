part of 'duel_question_page_cubit.dart';

@freezed
class DuelQuestionPageState with _$DuelQuestionPageState {
  const factory DuelQuestionPageState({
    required String? errorMessage,
    required DuelQuestionModel firstQuestion,
    required DuelQuestionModel secondQuestion,
    required DuelQuestionModel thirdQuestion,
    required DuelQuestionModel fourthQuestion,
    required DuelQuestionModel fifthQuestion,
    required Status status,
    required List<String?> answersOne,
    required List<String?> answersTwo,
    required List<String?> answersThree,
    required List<String?> answersFour,
    required List<String?> answersFive,
  }) = _Initial;
}
