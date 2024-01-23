import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@injectable
class RankingFireBaseDataSource {
  final UserId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> setProfile(
      {required String nickName, required String email}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("profile")
        .add({
      "email": email,
      "nickName": nickName,
      "points": 0,
      "gamesPlayed": 0
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProfileInfo() {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("profile")
        .snapshots();
  }

  Future<void> updateStats({required int points, required String docId}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("profile")
        .doc(docId)
        .update({
      "points": FieldValue.increment(points),
      "gamesPlayed": FieldValue.increment(1)
    });
  }
}
