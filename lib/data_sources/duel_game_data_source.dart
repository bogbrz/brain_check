import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@injectable
class DuelGameDataSource {
  final user = FirebaseAuth.instance.currentUser;
  Future<void> createRoom(
      {required String name,
      required String password,
      required String nickName}) async {
    await FirebaseFirestore.instance.collection("GameRooms").add({
      "owner": user!.email,
      "name": name,
      "password": password,
      "nickName": nickName,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGameRooms() {
    return FirebaseFirestore.instance.collection("GameRooms").snapshots();
  }

  Future<void> joinPlayer(
      {required String email,
      required String nickName,
      required String id,
      required int playerNumber}) async {
    await FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(id)
        .collection("Players")
        .add({
      "email": email,
      "nickName": nickName,
      "points": 0,
      "player": playerNumber,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPlayers({required String id}) {
    return FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(id)
        .collection("Players")
        .snapshots();
  }

  Future<void> leaveRoom({required String id, required String roomId}) async {
    return FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Players")
        .doc(id)
        .delete();
  }

  Future<void> deleteRoom({
    required String id,
  }) async {
    return FirebaseFirestore.instance.collection("GameRooms").doc(id).delete();
  }
}
