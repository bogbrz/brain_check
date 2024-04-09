import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranked_game_state.dart';
part 'ranked_game_cubit.freezed.dart';

class RankedGameCubit extends Cubit<RankedGameState> {
  RankedGameCubit(
      {required this.rankingRepository, required this.questionRepository})
      : super(const RankedGameState(
            errorMessage: null, profile: [], status: Status.initial));

  final RankingRepository rankingRepository;
  final QuestionRepository questionRepository;
  StreamSubscription? streamSubscription;
  Future<void> getRankingForUpdate({required String email}) async {
    emit(const RankedGameState(
        errorMessage: null, profile: [], status: Status.loading));

    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(RankedGameState(
            errorMessage: null, profile: event, status: Status.success));
      } catch (error) {
        emit(RankedGameState(
            errorMessage: error.toString(), profile: [], status: Status.error));
      }
    });
  }

  Future<void> updateLifes(
      {required String profileId, required DateTime lastLogin}) async {
    return rankingRepository.restoreLifes(
        playerId: profileId, lastLogin: lastLogin);
  }
}
