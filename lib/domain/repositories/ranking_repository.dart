import 'dart:async';

import 'package:brain_check/data_sources/ranking_data_source.dart';
import 'package:brain_check/domain/models/profile_model.dart';

class RankingRepository {
  final RankingFireBaseDataSource rankingFireBaseDataSource;

  RankingRepository({required this.rankingFireBaseDataSource});

  Future<void> addProfileToGlobal(
      {required String nickName,
      required String email,
      required String? imageUrl}) async {
    await rankingFireBaseDataSource.addToRanking(
        nickName: nickName, email: email, imageUrl: imageUrl);
  }

  Stream<List<ProfileModel>> getRanking() {
    return rankingFireBaseDataSource.getRanking().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProfileModel(
            id: doc.id,
            email: doc['email'],
            nickName: doc['nickName'],
            points: doc['points'],
            gamesPlayed: doc["gamesPlayed"],
            lifes: doc["lifes"],
            lastLogIn: doc["lastLogIn"],
            gameStarted: doc["gameStarted"],
            gameEnd: doc["gameEnd"],
            imageUrl: doc["imageUrl"]);
      }).toList();
    });
  }

  Stream<List<ProfileModel>> getRankingForUpdate({required String email}) {
    return rankingFireBaseDataSource.getRanking().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return ProfileModel(
                id: doc.id,
                email: doc['email'],
                nickName: doc['nickName'],
                points: doc['points'],
                gamesPlayed: doc["gamesPlayed"],
                lifes: doc["lifes"],
                lastLogIn: doc["lastLogIn"],
                gameStarted: doc["gameStarted"],
                gameEnd: doc["gameEnd"],
                imageUrl: doc["imageUrl"]);
          })
          .where((element) => element.email == email)
          .toList();
    });
  }

  Future<void> restoreLifes(
      {required String playerId, required DateTime lastLogin}) async {
    return rankingFireBaseDataSource.restoreLifes(
        playerId: playerId, lastLogin: lastLogin);
  }

  Future<void> updateRanking({required int points, required String id}) async {
    return rankingFireBaseDataSource.updateRanking(points: points, docId: id);
  }
  Future<void> updateProfilePicture({ required String imageUrl, required String docId, }) async {
    return rankingFireBaseDataSource.updateProfile(imageUrl: imageUrl, docId: docId, );
  }
  Future<void> updateNickName({ required String docId, required String nickName}) async {
    return rankingFireBaseDataSource.updateNickName( docId: docId, nickName: nickName);
  }

  Future<void> setStartTime({required String playerId}) async {
    return rankingFireBaseDataSource.setStartTime(playerId: playerId);
  }

  Future<void> setEndTime({required String playerId}) async {
    return rankingFireBaseDataSource.setEndTime(playerId: playerId);
  }
}
