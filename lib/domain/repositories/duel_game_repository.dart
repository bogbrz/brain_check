import 'package:brain_check/data_sources/duel_game_data_source.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/models/player_model.dart';

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

  Future<void> joinPlayerOne(
      {required String email,
      required String nickName,
      required String id}) async {
    return duelGameDataSource.joinPlayerOne(
        email: email, nickName: nickName, id: id);
  }

  Stream<List<PlayerModel>> getPlayerOneInfo({required String id}) {
    return duelGameDataSource.getPlayerOneInfo(id: id).map((event) {
      return event.docs.map((e) {
        return PlayerModel(
            email: e["email"],
            nickName: e["nickName"],
            points: e["points"],
            id: e.id);
      }).toList();
    });
  }

   Future<void> leaveRoom({required String id, required String roomId}) async {
    return duelGameDataSource.leaveRoom(id: id, roomId: roomId);
  }
}
