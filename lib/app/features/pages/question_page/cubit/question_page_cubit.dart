import 'package:bloc/bloc.dart';
import 'package:brain_check/app/domain/models/question_model.dart';
import 'package:brain_check/app/domain/repositories/questions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_page_state.dart';
part 'question_page_cubit.freezed.dart';

class QuestionPageCubit extends Cubit<QuestionPageState> {
  QuestionPageCubit({required this.questionRepository})
      : super(QuestionPageState(errorMessage: null, questions: []));

  final QuestionRepository questionRepository;

  Future<void> questionsList(
      {required String category, required String difficulty}) async {
    if (category == "General Knowledge") {
      questionRepository.getQuestion(category: 9, difficulty: difficulty);
    }
    if (category == "Entertainment: Books") {
      questionRepository.getQuestion(category: 10, difficulty: difficulty);
    }
    if (category == "Entertainment: Film") {
      questionRepository.getQuestion(category: 11, difficulty: difficulty);
    }
    if (category == "Entertainment: Music") {
      questionRepository.getQuestion(category: 12, difficulty: difficulty);
    }
    if (category == "Entertainment: Musicals & Theatres") {
      questionRepository.getQuestion(category: 13, difficulty: difficulty);
    }
    if (category == "Entertainment: Television") {
      questionRepository.getQuestion(category: 14, difficulty: difficulty);
    }
    if (category == "Entertainment: Video Games") {
      questionRepository.getQuestion(category: 15, difficulty: difficulty);
    }
    if (category == "Entertainment: Board Games") {
      questionRepository.getQuestion(category: 16, difficulty: difficulty);
    }
    if (category == "Science & Nature") {
      questionRepository.getQuestion(category: 17, difficulty: difficulty);
    }
    if (category == "Science: Computers") {
      questionRepository.getQuestion(category: 18, difficulty: difficulty);
    }
    if (category == "Science: Mathematics") {
      questionRepository.getQuestion(category: 19, difficulty: difficulty);
    }
    if (category == "Mythology") {
      questionRepository.getQuestion(category: 20, difficulty: difficulty);
    }
    if (category == "Sports") {
      questionRepository.getQuestion(category: 21, difficulty: difficulty);
    }
    if (category == "Geography") {
      questionRepository.getQuestion(category: 22, difficulty: difficulty);
    }
    if (category == "History") {
      questionRepository.getQuestion(category: 23, difficulty: difficulty);
    }
    if (category == "Politics") {
      questionRepository.getQuestion(category: 24, difficulty: difficulty);
    }
    if (category == "Art") {
      questionRepository.getQuestion(category: 25, difficulty: difficulty);
    }
    if (category == "Celebrities") {
      questionRepository.getQuestion(category: 26, difficulty: difficulty);
    }
    if (category == "Animals") {
      questionRepository.getQuestion(category: 27, difficulty: difficulty);
    }
    if (category == "Vehicles") {
      questionRepository.getQuestion(category: 28, difficulty: difficulty);
    }
    if (category == "Entertainment: Comics") {
      questionRepository.getQuestion(category: 29, difficulty: difficulty);
    }
    if (category == "Science: Gadgets") {
      questionRepository.getQuestion(category: 30, difficulty: difficulty);
    }
    if (category == "Entertainment: Japanese Anime & Manga") {
      questionRepository.getQuestion(category: 31, difficulty: difficulty);
    }
    if (category == "Entertainment: Cartoon & animations") {
      questionRepository.getQuestion(category: 32, difficulty: difficulty);
    }
    if (category == "Random") {
      questionRepository.getQuestion(category: null, difficulty: difficulty);
    }
  }
}
