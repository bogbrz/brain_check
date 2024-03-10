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
  }) = _Initial;
}
