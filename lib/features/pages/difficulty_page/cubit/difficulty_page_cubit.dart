import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/categories_info_model.dart';
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'difficulty_page_state.dart';
part 'generated/difficulty_page_cubit.freezed.dart';

class DifficultyPageCubit extends Cubit<DifficultyPageState> {
  DifficultyPageCubit(
      {required this.questionRepository, required this.rankingRepository})
      : super(DifficultyPageState(
            status: Status.initial,
            overAll: Overall(
                totalNumOfQuestions: 0,
                totalNumOfPendingQuestions: 0,
                totalNumOfVerifiedQuestions: 0,
                totalNumOfRejectedQuestions: 0),
            errorMessage: null,
            info: CategoryQuestionCount(
                totalQuestionCount: 0,
                totalEasyQuestionCount: 0,
                totalMediumQuestionCount: 0,
                totalHardQuestionCount: 0)));
  final QuestionRepository questionRepository;
  final RankingRepository rankingRepository;

  Future<void> getCategoryInfo({required int category}) async {
    emit(DifficultyPageState(
        overAll: Overall(
            totalNumOfQuestions: 0,
            totalNumOfPendingQuestions: 0,
            totalNumOfVerifiedQuestions: 0,
            totalNumOfRejectedQuestions: 0),
        errorMessage: null,
        info: CategoryQuestionCount(
            totalQuestionCount: 0,
            totalEasyQuestionCount: 0,
            totalMediumQuestionCount: 0,
            totalHardQuestionCount: 0),
        status: Status.loading));

    if (category == 0) {
      try {
        final info = await questionRepository.getOverAllInfo();
       
        emit(DifficultyPageState(
            overAll: info,
            errorMessage: null,
            info: CategoryQuestionCount(
                totalQuestionCount: 0,
                totalEasyQuestionCount: 0,
                totalMediumQuestionCount: 0,
                totalHardQuestionCount: 0),
            status: Status.success));
      } catch (error) {
        emit(DifficultyPageState(
            overAll: Overall(
                totalNumOfQuestions: 0,
                totalNumOfPendingQuestions: 0,
                totalNumOfVerifiedQuestions: 0,
                totalNumOfRejectedQuestions: 0),
            errorMessage: error.toString(),
            info: CategoryQuestionCount(
                totalQuestionCount: 0,
                totalEasyQuestionCount: 0,
                totalMediumQuestionCount: 0,
                totalHardQuestionCount: 0),
            status: Status.error));
      }
    } else {
      try {
        final info =
            await questionRepository.getCategoryInfo(category: category);
    
        emit(DifficultyPageState(
            overAll: Overall(
                totalNumOfQuestions: 0,
                totalNumOfPendingQuestions: 0,
                totalNumOfVerifiedQuestions: 0,
                totalNumOfRejectedQuestions: 0),
            errorMessage: null,
            info: info,
            status: Status.success));
      } catch (error) {
        emit(DifficultyPageState(
            overAll: Overall(
                totalNumOfQuestions: 0,
                totalNumOfPendingQuestions: 0,
                totalNumOfVerifiedQuestions: 0,
                totalNumOfRejectedQuestions: 0),
            errorMessage: error.toString(),
            info: CategoryQuestionCount(
                totalQuestionCount: 0,
                totalEasyQuestionCount: 0,
                totalMediumQuestionCount: 0,
                totalHardQuestionCount: 0),
            status: Status.error));
      }
    }
  }

  Future<void> setStartTime({required String playerId}) async {
    return rankingRepository.setStartTime(playerId: playerId);
  }
}
