import 'package:brain_check/data_sources/duel_game_data_source.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

class DuelGameRepository {
  DuelGameRepository({required this.duelGameDataSource});
  final DuelGameDataSource duelGameDataSource;
  Future<void> createRoom(
      {required String name, required String password, required String nickName}) async {
    return duelGameDataSource.createRoom(name: name, password: password, nickName: nickName);
  }

  Stream<List<GameRoomModel>> getRooms() {
    return duelGameDataSource.getGameRooms().map((event) {
      return event.docs.map((e) {
        return GameRoomModel(
            name: e["name"], ownerMail: e["owner"], password: e["password"]);
      }).toList();
    });
  }
}
