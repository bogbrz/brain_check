import 'dart:async';

import 'package:brain_check/data_sources/ranking_data_source.dart';
import 'package:brain_check/domain/models/profile_model.dart';

class RankingRepository {
  final RankingFireBaseDataSource rankingFireBaseDataSource;
 

  RankingRepository({required this.rankingFireBaseDataSource});

  Future<void> addProfile(
      {required String nickName, required String email}) async {
    await rankingFireBaseDataSource.setProfile(
        nickName: nickName, email: email);
  }
   Future<void> addProfileToGlobal(
      {required String nickName, required String email}) async {
    await rankingFireBaseDataSource.addToRanking(
        nickName: nickName, email: email);
  }

  Stream<List<ProfileModel>> getProfile() {

    
    return rankingFireBaseDataSource.getProfileInfo().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProfileModel(
            id: doc.id,
            email: doc['email'],
            nickName: doc['nickName'],
            points: doc['points'],
            gamesPlayed: doc["gamesPlayed"]);
      }).toList();
    });
  }
    Stream<List<ProfileModel>> getRanking() {

    
    return rankingFireBaseDataSource.getRanking().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProfileModel(
            id: doc.id,
            email: doc['email'],
            nickName: doc['nickName'],
            points: doc['points'],
            gamesPlayed: doc["gamesPlayed"]);
      }).toList();
    });
  }

  Future<void> updateStats({required int points, required String id}) async {
    return rankingFireBaseDataSource.updateStats(points: points, docId: id);
  }
}
