import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';
part 'generated/home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
      {required this.rankingRepository, required this.questionRepository})
      : super(HomePageState(
            status: Status.initial,
            errorMessage: null,
            profile: [],
            overAllInfo: Overall(
                totalNumOfPendingQuestions: 0,
                totalNumOfQuestions: 0,
                totalNumOfRejectedQuestions: 0,
                totalNumOfVerifiedQuestions: 0)));
  final RankingRepository rankingRepository;
  final QuestionRepository questionRepository;
  StreamSubscription? streamSubscription;

  Future<void> updateLifes(
      {required String profileId, required DateTime lastLogin}) async {
    return rankingRepository.restoreLifes(
        playerId: profileId, lastLogin: lastLogin);
  }

  Future<void> getRankingForUpdate({required String email}) async {
    emit(HomePageState(
        errorMessage: null,
        profile: [],
        overAllInfo: Overall(
            totalNumOfPendingQuestions: 0,
            totalNumOfQuestions: 0,
            totalNumOfRejectedQuestions: 0,
            totalNumOfVerifiedQuestions: 0),
        status: Status.loading));
    final info = await questionRepository.getOverAllInfo();
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(HomePageState(
            errorMessage: null,
            profile: event,
            overAllInfo: info,
            status: Status.success));
      } catch (error) {
        emit(HomePageState(
            errorMessage: error.toString(),
            profile: [],
            overAllInfo: info,
            status: Status.error));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
