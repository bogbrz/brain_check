import 'package:brain_check/data_sources/duel_game_data_source.dart';

class DuelGameRepository {
  DuelGameRepository({required this.duelGameDataSource});
  final DuelGameDataSource duelGameDataSource;
  Future<void> createRoom(
      {required String name, required String password}) async {
    return duelGameDataSource.createRoom(name: name, password: password);
  }
}
