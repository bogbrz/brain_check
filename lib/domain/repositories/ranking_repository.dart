import 'dart:async';

import 'package:brain_check/data_sources/ranking_data_source.dart';
import 'package:brain_check/domain/models/profile_model.dart';

class RankingRepository {
  final RankingFireBaseDataSource rankingFireBaseDataSource;
  StreamSubscription? streamSubscription;

  RankingRepository({required this.rankingFireBaseDataSource});

  Future<void> addProfile(
      {required String nickName, required String email}) async {
    await rankingFireBaseDataSource.setProfile(
        nickName: nickName, email: email);
  }

  Stream<List<ProfileModel>> getProfile() {
    return rankingFireBaseDataSource.getProfileInfo().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProfileModel(
          email: doc['email'],
          nickName: doc['nickName'],
          points: doc['points'],
        );
      }).toList();
    });
  }
}