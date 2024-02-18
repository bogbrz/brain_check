import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@injectable
class RankingFireBaseDataSource {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addToRanking(
      {required String nickName, required String email}) async {
    if (userId == null) {
      throw Exception("user not logged in");
    }
    await FirebaseFirestore.instance.collection("Ranking").add({
      "email": email,
      "nickName": nickName,
      "points": 0,
      "gamesPlayed": 0,
      "lifes": 5
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProfileInfo() {
    if (userId == null) {
      throw Exception("user not logged in");
    }

    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("profile")
        .snapshots();
  }

  Future<void> updateStats({required int points, required String docId}) async {
    if (userId == null) {
      throw Exception("user not logged in");
    }

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("profile")
        .doc(docId)
        .update({
      "points": FieldValue.increment(points),
      "gamesPlayed": FieldValue.increment(1)
    });
  }

  Future<void> updateRanking(
      {required int points, required String docId}) async {
    await FirebaseFirestore.instance.collection("Ranking").doc(docId).update({
      "points": FieldValue.increment(points),
      "gamesPlayed": FieldValue.increment(1),
      "lifes": FieldValue.increment(-1),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRanking() {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .orderBy("points", descending: true)
        .snapshots();
  }

  Future<void> restoreLifes({required String id}) async {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .doc(id)
        .update({"lifes": 5});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRankingForUpdate(
      {required String email}) {
    return FirebaseFirestore.instance
        .collection("Ranking")
        .where("email" == email)
        .snapshots();
  }
}
