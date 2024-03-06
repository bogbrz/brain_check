import 'package:brain_check/domain/models/question_model.dart';
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

  Future<void> addQtoFirebase(
      {required QuestionModel questionModel, required String roomId}) async {
    await FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Questions")
        .add({
      "question": questionModel.question,
      "correctAnswer": questionModel.correctAnswer,
      "incorrectOne": questionModel.incorrectAnswers[0],
      "incorrectTwo": questionModel.incorrectAnswers[1],
      "incorrectThree": questionModel.incorrectAnswers[2],
      "category" : questionModel.category,
      "difficulty" : questionModel.difficulty,

    });
  }

  Future<void> readyStatus(
      {required String id, required bool ready, required String roomId}) async {
    return FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Players")
        .doc(id)
        .update({
      "ready": ready,
    });
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
      "ready": false,
      "startGame": false
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

  Future<void> resetGameStatus({
    required String roomId,
    required bool status,
    required String playerId,
  }) async {
    return FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Players")
        .doc(playerId)
        .update({"startGame": status});
  }

  Future<void> startGame(
      {required String roomId,
      required bool status,
      required String playerOneId,
      required String playerTwoId}) async {
    await FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Players")
        .doc(playerOneId)
        .update({"startGame": status});
    await FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("Players")
        .doc(playerTwoId)
        .update({"startGame": status});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> roomStatus(
      {required String roomId}) {
    return FirebaseFirestore.instance
        .collection("GameRooms")
        .doc(roomId)
        .collection("RoomStatus")
        .snapshots();
  }

  Future<void> deleteRoom({
    required String id,
  }) async {
    return FirebaseFirestore.instance.collection("GameRooms").doc(id).delete();
  }
}
