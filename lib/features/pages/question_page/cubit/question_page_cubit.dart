import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_page_state.dart';
part 'question_page_cubit.freezed.dart';

class QuestionPageCubit extends Cubit<QuestionPageState> {
  QuestionPageCubit({required this.questionRepository})
      : super(QuestionPageState(
          errorMessage: null,
          questions: [],
        ));

  final QuestionRepository questionRepository;

  Future<void> getQuestion(
      {required int category, required String difficulty}) async {
    final questionContent = await questionRepository.getQuestion(
        category: category, difficulty: difficulty);
    try {
      emit(QuestionPageState(
        errorMessage: null,
        questions: questionContent,
      ));
    } catch (error) {
      emit(QuestionPageState(
        errorMessage: error.toString(),
        questions: [],
      ));
    }
  }
}
