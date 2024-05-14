import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/models/room_status_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_room_page_state.dart';
part 'generated/duel_room_page_cubit.freezed.dart';

class DuelRoomPageCubit extends Cubit<DuelRoomPageState> {
  DuelRoomPageCubit(
      {required this.duelGameRepository, required this.questionRepository})
      : super(const DuelRoomPageState(
            errorMessage: null,
            status: Status.initial,
            playerTwo: [],
            playerOne: [],
            players: [],
            roomStatus: [],
            categories: []));
  final DuelGameRepository duelGameRepository;
  final QuestionRepository questionRepository;
  StreamSubscription? streamSubscriptionOne;

  Future<void> joinPlayer(
      {required String email,
      required String nickName,
      required String id,
      required int playerNumber,
      required String userPicture}) async {
    return duelGameRepository.joinPlayer(
        userPicture: userPicture,
        email: email,
        nickName: nickName,
        id: id,
        playerNumber: playerNumber);
  }

  Future<void> readyStatus(
      {required String id, required bool ready, required String roomId}) async {
    return duelGameRepository.readyStatus(id: id, ready: ready, roomId: roomId);
  }

  Future<void> updateCategory(
      {required String playerId,
      required String category,
      required String roomId}) async {
    return duelGameRepository.updateCategory(
        playerId: playerId, category: category, roomId: roomId);
  }

  Future<void> startGame(
      {required String roomId,
      required bool status,
      required String playerOneId,
      required String playerTwoId}) async {
    return duelGameRepository.startGame(
        roomId: roomId,
        status: status,
        playerOneId: playerOneId,
        playerTwoId: playerTwoId);
  }

  Future<void> leaveRoom({required String id, required String roomId}) async {
    return duelGameRepository.leaveRoom(id: id, roomId: roomId);
  }

  Future<void> resetRounds(
      {required String playerId, required String roomId}) async {
    return duelGameRepository.resetRounds(playerId: playerId, roomId: roomId);
  }

  Future<void> deleteScore(
      {required String roomId, required int roundNumber}) async {
    streamSubscriptionOne =
        duelGameRepository.getRoundsScores(roomId: roomId).listen((event) {
      for (final score in event) {
        duelGameRepository.deleteScore(roomId: roomId, roundId: score.id);
      }
    });
  }

  Future<void> setCategory({required String id, required String roomId}) async {
    return duelGameRepository.leaveRoom(id: id, roomId: roomId);
  }

  Future<void> deleteRoom({
    required String id,
  }) async {
    return duelGameRepository.deleteRoom(
      id: id,
    );
  }

  Future<void> addQtoFirebase({
    required String roomId,
    required int categoryId,
    required int roundNumber,
  }) async {
    await duelGameRepository.addQtoFirebase(
        roomId: roomId, categoryId: categoryId, roundNumber: roundNumber);
  }

  Future<void> updatePlayersCount(
      {required String roomId, required int value}) async {
    return duelGameRepository.updatePlayersCount(roomId: roomId, value: value);
  }

  Future<void> playerInfo({
    required String id,
  }) async {
    emit(const DuelRoomPageState(
      players: [],
      errorMessage: null,
      status: Status.loading,
      playerTwo: [],
      playerOne: [],
      roomStatus: [],
      categories: [],
    ));

    final categories = await questionRepository.getCategories();

    duelGameRepository
        .getPlayerInfo(
      id: id,
    )
        .listen((event) {
      final playerOneList = event
          .where(
            (element) => element.player == 1,
          )
          .toList();

      final playerTwoList = event
          .where(
            (element) => element.player == 2,
          )
          .toList();
      try {
        emit(DuelRoomPageState(
            errorMessage: null,
            status: Status.success,
            playerTwo: playerTwoList,
            playerOne: playerOneList,
            players: event,
            roomStatus: [],
            categories: categories));
      } catch (e) {
        emit(DuelRoomPageState(
            errorMessage: e.toString(),
            status: Status.error,
            playerTwo: [],
            playerOne: [],
            players: [],
            roomStatus: [],
            categories: []));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscriptionOne?.cancel();
    return super.close();
  }
}
