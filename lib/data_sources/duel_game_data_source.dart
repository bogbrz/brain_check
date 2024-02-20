import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@injectable
class DuelGameDataSource {
  final user = FirebaseAuth.instance.currentUser;
  Future<void> createRoom(
      {required String name, required String password}) async {
    await FirebaseFirestore.instance.collection("GameRooms").add({
      "owner": user!.email,
      "name": name,
      "password": password,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getGameRooms() {
    return FirebaseFirestore.instance.collection("GameRooms").snapshots();
  }
}
