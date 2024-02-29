import 'package:brain_check/data_sources/duel_game_data_source.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:injectable/injectable.dart';
@injectable
class DuelGameRepository {
  DuelGameRepository({required this.duelGameDataSource});
  final DuelGameDataSource duelGameDataSource;
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
            id: e.id);
      }).toList();
    });
  }

  Future<void> readyStatus(
      {required String id, required bool ready, required String roomId}) async {
    return duelGameDataSource.readyStatus(id: id, ready: ready, roomId: roomId);
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
            id: e.id);
      }).toList();
    });
  }

  Future<void> leaveRoom({required String id, required String roomId}) async {
    return duelGameDataSource.leaveRoom(id: id, roomId: roomId);
  }

  Future<void> deleteRoom({
    required String id,
  }) async {
    return duelGameDataSource.deleteRoom(
      id: id,
    );
  }
}
