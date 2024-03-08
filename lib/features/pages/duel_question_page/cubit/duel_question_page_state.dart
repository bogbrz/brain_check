part of 'duel_question_page_cubit.dart';

@freezed
class DuelQuestionPageState with _$DuelQuestionPageState {
  const factory DuelQuestionPageState({required String? errorMessage, required List<DuelQuestionModel> questions, required Status status}) = _Initial;
}
