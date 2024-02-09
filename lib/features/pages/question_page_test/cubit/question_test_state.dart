part of 'question_test_cubit.dart';

@freezed
class QuestionTestPageState with _$QuestionTestPageState {
  factory QuestionTestPageState({
    required String? errorMessage,
    required List<QuestionModel> questions,

    required Status  status,
  }) = _QuestionTestPageState;
}