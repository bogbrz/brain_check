import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_page_state.dart';
part 'result_page_cubit.freezed.dart';

class ResultPageCubit extends Cubit<ResultPageState> {
  ResultPageCubit({required this.rankingRepository, required this.duelGameRepository})
      : super(const ResultPageState(
            errorMessage: null, profile: [], status: Status.initial));

  final RankingRepository rankingRepository;
  final DuelGameRepository duelGameRepository;
  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    emit(const ResultPageState(
        errorMessage: null, profile: [], status: Status.loading));
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(ResultPageState(
            errorMessage: null, profile: event, status: Status.success));
      } catch (error) {
        emit(ResultPageState(
            errorMessage: error.toString(), profile: [], status: Status.error));
      }
    });
  }

  Future<void> resetGameStatus(
      {required String roomId,
      required bool status,
      required String playerId,
      }) async {
    return duelGameRepository.resetGameStatus(
        roomId: roomId,
        status: status,
        playerId: playerId);
  }

  Future<void> updateRanking({required int points, required String id}) async {
    try {
      return rankingRepository.updateRanking(points: points, id: id);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
