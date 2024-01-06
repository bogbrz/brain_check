part of 'question_page_cubit.dart';

@freezed
class QuestionPageState with _$QuestionPageState {
  factory QuestionPageState(
      {required String? errorMessage,
      required List<QuestionModel> questions,
      }) = _QuestionPageState;
}
