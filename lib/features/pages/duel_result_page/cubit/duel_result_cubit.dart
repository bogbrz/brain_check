import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_result_state.dart';
part 'generated/duel_result_cubit.freezed.dart';

class DuelResultCubit extends Cubit<DuelResultState> {
  DuelResultCubit(
      {required this.duelGameRepository, required this.rankingRepository})
      : super(DuelResultState(
          gameLenght: null,
          errorMessage: null,
          status: Status.initial,
          profiles: [],
          gameDuration: null
        ));
  final DuelGameRepository duelGameRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;
  Future<void> resetGameStatus({
    required String roomId,
    required bool status,
    required String playerId,
    required int points,
  }) async {
    return duelGameRepository.resetGameStatus(
      roomId: roomId,
      status: status,
      playerId: playerId,
      points: points,
    );
  }

  Future<void> deleteQuestions({
    required String roomId,
    required int roundNumber,
  }) async {
    streamSubscription = duelGameRepository
        .getQuestionsFromFb(roomId: roomId, roundNumber: roundNumber)
        .listen((event) {
      try {
        for (final question in event) {
          duelGameRepository
              .deleteQuestions(
                  roomId: roomId,
                  roundNumber: roundNumber,
                  questionId: question.id.toString())
              .then((value) => print("Delete questions cubit"));
        }
      } catch (e) {
        print("DELETE Q ERROR ${e.toString()}");
      }
    });
  }

  Future<void> getRankingForUpdate({required String email}) async {
    emit(DuelResultState(
      gameDuration: null,
      gameLenght: null,
      errorMessage: null,
      profiles: [],
      status: Status.loading,
    ));
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      DateTime gameStart = event[0].gameStarted.toDate();
      DateTime gameEnd = event[0].gameEnd.toDate();

      Duration difference = gameEnd.difference(gameStart);
      String formattedDuration =
          "${difference.inMinutes.remainder(60)}:${(difference.inSeconds.remainder(60)).toString().padLeft(2, '0')}";
      try {
        emit(DuelResultState(
          gameDuration: difference,
            errorMessage: null,
            profiles: event,
            status: Status.success,
            gameLenght: formattedDuration));
      } catch (error) {
        emit(DuelResultState(
          gameDuration: null,
            gameLenght: formattedDuration,
            errorMessage: error.toString(),
            profiles: [],
            status: Status.error));
      }
    });
  }

  Future<void> updateRanking(
      {required int points, required String profileId}) async {
    try {
      rankingRepository
          .updateRanking(points: points, id: profileId)
          .then((value) => streamSubscription?.cancel());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addRoundResults(
      {required String roomId,
      required int playerNumber,
      required int roundNumber,
      required int answerOne,
      required int answerTwo,
      required int answerThree,
      required int answerFour,
      required int answerFive}) async {
    return duelGameRepository.addRoundResults(
        roundNumber: roundNumber,
        roomId: roomId,
        playerNumber: playerNumber,
        answerOne: answerOne,
        answerTwo: answerTwo,
        answerThree: answerThree,
        answerFour: answerFour,
        answerFive: answerFive);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
