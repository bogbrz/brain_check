import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@injectable
class RankingFireBaseDataSource {
  Future<void> addToRanking(
      {required String nickName,
      required String email,
      required String? imageUrl,
      required String userId}) async {
    await FirebaseFirestore.instance.collection("Ranking").add({
      "email": email,
      "nickName": nickName,
      "points": 0,
      "gamesPlayed": 0,
      "lifes": 5,
      "lastLogIn": DateTime.now(),
      "gameStarted": DateTime.now(),
      "gameEnd": DateTime.now(),
      "imageUrl": imageUrl,
      "userId": userId
    }).then((value) async =>
        await FirebaseAuth.instance.currentUser!.updateDisplayName(nickName));
  }

  Future<void> updateRanking(
      {required int points, required String docId}) async {
    await FirebaseFirestore.instance.collection("Ranking").doc(docId).update({
      "points": FieldValue.increment(points),
      "gamesPlayed": FieldValue.increment(1),
      "lifes": FieldValue.increment(-1),
    });
  }

  Future<void> updateProfile(
      {required String imageUrl,
      required String docId,
      required String nickName}) async {
    await FirebaseFirestore.instance.collection("Ranking").doc(docId).update({
      "nickName": nickName,
      "imageUrl": imageUrl,
    }).then((value) =>
        FirebaseAuth.instance.currentUser!.updateDisplayName(nickName));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRanking() {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .orderBy("points", descending: true)
        .snapshots();
  }

  Future<void> restoreLifes(
      {required String playerId, required DateTime lastLogin}) async {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .doc(playerId)
        .update({"lifes": 5, "lastLogIn": lastLogin});
  }

  Future<void> setStartTime({
    required String playerId,
  }) async {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .doc(playerId)
        .update({"gameStarted": DateTime.now()});
  }

  Future<void> setEndTime({
    required String playerId,
  }) async {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .doc(playerId)
        .update({"gameEnd": DateTime.now()});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRankingForUpdate(
      {required String email}) {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .where("email" == email)
        .snapshots();
  }
}
