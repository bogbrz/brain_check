import 'dart:async';

import 'package:brain_check/data_sources/ranking_data_source.dart';
import 'package:brain_check/data_sources/storage_data_source.dart';
import 'package:brain_check/domain/models/profile_model.dart';

class RankingRepository {
  final RankingFireBaseDataSource rankingFireBaseDataSource;
  final StorageDataSource storageDataSource;

  RankingRepository(
      {required this.rankingFireBaseDataSource,
      required this.storageDataSource});

  Future<void> addProfileToGlobal(
      {required String nickName,
      required String email,
      required String? imageUrl,
      required String userId}) async {
    await rankingFireBaseDataSource.addToRanking(
        nickName: nickName, email: email, imageUrl: imageUrl, userId: userId);
  }

  Stream<List<ProfileModel>> getRanking() {
    return rankingFireBaseDataSource.getRanking().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProfileModel(
            userId: doc["userId"],
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

  Stream<List<ProfileModel>> getRankingForUpdate({required String email,required String userId}) {
    return rankingFireBaseDataSource.getRanking().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return ProfileModel(
                userId: doc["userId"],
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
          .where((element) => element.email == email).where((element) => element.userId == userId)
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

  Future<void> updateProfile(
      {required String imageUrl,
      required String docId,
      required String nickName}) async {
    final list = await storageDataSource.getImages();
    if (list!.isEmpty) {
      null;
      print("LIST $list IS EMPTY");
    }

    final uploadedImages = list;
    final uploadedImageUrl = await uploadedImages[0].getDownloadURL();
    print(uploadedImageUrl);
    return rankingFireBaseDataSource.updateProfile(
        imageUrl: uploadedImageUrl, docId: docId, nickName: nickName);
  }

  Future<void> setStartTime({required String playerId}) async {
    return rankingFireBaseDataSource.setStartTime(playerId: playerId);
  }

  Future<void> setEndTime({required String playerId}) async {
    return rankingFireBaseDataSource.setEndTime(playerId: playerId);
  }
}
