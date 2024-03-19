import 'package:brain_check/data_sources/duel_game_data_source.dart';
import 'package:brain_check/data_sources/questions_data_source.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/models/room_status_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class DuelGameRepository {
  DuelGameRepository(
      {required this.duelGameDataSource, required this.questionDataSource});
  final DuelGameDataSource duelGameDataSource;
  final QuestionDataSource questionDataSource;
  Future<void> createRoom(
      {required String name,
      required String password,
      required String nickName}) async {
    return duelGameDataSource.createRoom(
        name: name, password: password, nickName: nickName);
  }

  Stream<List<GameRoomModel>> getRooms() {
    return duelGameDataSource.getGameRooms().map((event) {
      return event.docs.map((e) {
        return GameRoomModel(
          name: e["name"],
          ownerMail: e["owner"],
          password: e["password"],
          nickName: e["nickName"],
          playersAmount: e["playersAmount"],
          id: e.id,
        );
      }).toList();
    });
  }

  Future<void> addQtoFirebase({
    required String roomId,
    required int categoryId,
    required int roundNumber,
    required String playerId,
  }) async {
    final token = await questionDataSource.getToken();

    final questionsList = await questionDataSource.getListofQuestions(
        "easy", categoryId, 5, token.token);
    final results = questionsList.results;
    for (final question in results) {
      await duelGameDataSource.addQtoFirebase(
          questionModel: question, roomId: roomId, roundNumber: roundNumber);
    }
  }

  Stream<List<DuelQuestionModel>> getQuestionsFromFb(
      {required String roomId, required int roundNumber}) {
    return duelGameDataSource
        .getQuestionsFromFb(roomId: roomId, roundNumber: roundNumber)
        .map((event) {
      return event.docs
          .map((e) {
            return DuelQuestionModel(
              question: e["question"],
              correctAnswer: e["correctAnswer"],
              incorrectOne: e["incorrectOne"],
              incorrectTwo: e["incorrectTwo"],
              incorrectThree: e["incorrectThree"],
              category: e["category"],
              difficulty: e["difficulty"],
              id: e.id,
              roundNumber: e["roundNumber"],
            );
          })
         
          .toList();
    });
  }

  Future<void> resetGameStatus(
      {required String roomId,
      required bool status,
      required String playerId,
      required int points}) async {
    await duelGameDataSource.resetGameStatus(
      roomId: roomId,
      status: status,
      playerId: playerId,
      points: points,
    );
  }

  Future<void> updatePlayersCount({
    required String roomId,
    required int value,
  }) async {
    return duelGameDataSource.updatePlayersCount(roomId: roomId, value: value);
  }

  Stream<List<RoomStatusModel>> getRoomStatus({required String roomId}) {
    return duelGameDataSource.roomStatus(roomId: roomId).map((event) {
      return event.docs.map((e) {
        return RoomStatusModel(startGame: e["startGame"], id: e.id);
      }).toList();
    });
  }

  Future<void> readyStatus(
      {required String id, required bool ready, required String roomId}) async {
    return duelGameDataSource.readyStatus(id: id, ready: ready, roomId: roomId);
  }

  Future<void> startGame(
      {required String roomId,
      required bool status,
      required String playerOneId,
      required String playerTwoId}) async {
    return duelGameDataSource.startGame(
        roomId: roomId,
        status: status,
        playerOneId: playerOneId,
        playerTwoId: playerTwoId);
  }

  Future<void> joinPlayer(
      {required String email,
      required String nickName,
      required String id,
      required int playerNumber}) async {
    return duelGameDataSource.joinPlayer(
        email: email, nickName: nickName, id: id, playerNumber: playerNumber);
  }

  Stream<List<PlayerModel>> getPlayerInfo({
    required String id,
  }) {
    return duelGameDataSource.getPlayers(id: id).map((event) {
      return event.docs.map((e) {
        return PlayerModel(
          email: e["email"],
          nickName: e["nickName"],
          points: e["points"],
          player: e["player"],
          ready: e["ready"],
          startGame: e["startGame"],
          id: e.id,
          roundNumber: e["roundNumber"],
        );
      }).toList();
    });
  }

  Future<void> leaveRoom({required String id, required String roomId}) async {
    return duelGameDataSource.leaveRoom(id: id, roomId: roomId);
  }

  Future<void> resetRounds(
      {required String playerId, required String roomId}) async {
    return duelGameDataSource.resetRounds(playerId: playerId, roomId: roomId);
  }

  Future<void> deleteRoom({
    required String id,
  }) async {
    return duelGameDataSource.deleteRoom(
      id: id,
    );
  }
}
