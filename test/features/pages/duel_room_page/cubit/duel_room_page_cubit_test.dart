import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockDuelGameRepository extends Mock implements DuelGameRepository {}

void main() {
  late DuelRoomPageCubit sut;
  late MockQuestionRepository repository;
  late MockDuelGameRepository repository1;
  setUp(() {
    repository = MockQuestionRepository();
    repository1 = MockDuelGameRepository();
    sut = DuelRoomPageCubit(
        questionRepository: repository, duelGameRepository: repository1);
  });

  group("joinPlayer", () {
    test("should call duelGameRepository.joinPlayer once", () async {
      when(
        () => repository1.joinPlayer(
            email: "email",
            nickName: "nickName",
            id: "id",
            playerNumber: 1,
            userPicture: "userPicture"),
      ).thenAnswer((_) async => []);
      await sut.joinPlayer(
          email: "email",
          nickName: "nickName",
          id: "id",
          playerNumber: 1,
          userPicture: "userPicture");

      verify(
        () => repository1.joinPlayer(
            email: "email",
            nickName: "nickName",
            id: "id",
            playerNumber: 1,
            userPicture: "userPicture"),
      ).called(1);
    });
  });
  group("readyStatus", () {
    test("should call duelGameRepository.readyStatus once", () async {
      when(
        () => repository1.readyStatus(
          ready: true,
          roomId: "1",
          id: "id",
        ),
      ).thenAnswer((_) async => []);
      await sut.readyStatus(
        ready: true,
        roomId: "1",
        id: "id",
      );

      verify(
        () => repository1.readyStatus(
          ready: true,
          roomId: "1",
          id: "id",
        ),
      ).called(1);
    });
  });
  group("updateCategory", () {
    test("should call duelGameRepository.updateCategory once", () async {
      when(
        () => repository1.updateCategory(
            playerId: "1", roomId: "1", category: "1"),
      ).thenAnswer((_) async => []);
      await sut.updateCategory(playerId: "1", roomId: "1", category: "1");

      verify(
        () => repository1.updateCategory(
            playerId: "1", roomId: "1", category: "1"),
      ).called(1);
    });
  });
  group("startGame", () {
    test("should call duelGameRepository.startGame once", () async {
      when(
        () => repository1.startGame(
            playerTwoId: "1", playerOneId: "1", roomId: "1", status: true),
      ).thenAnswer((_) async => []);
      await sut.startGame(
          playerTwoId: "1", playerOneId: "1", roomId: "1", status: true);

      verify(
        () => repository1.startGame(
            playerTwoId: "1", playerOneId: "1", roomId: "1", status: true),
      ).called(1);
    });
  });
  group("leaveRoom", () {
    test("should call duelGameRepository.leaveRoom once", () async {
      when(
        () => repository1.leaveRoom(id: "1", roomId: "1"),
      ).thenAnswer((_) async => []);
      await sut.leaveRoom(id: "1", roomId: "1");

      verify(
        () => repository1.leaveRoom(id: "1", roomId: "1"),
      ).called(1);
    });
  });
  group("resetRounds", () {
    test("should call duelGameRepository.resetRounds once", () async {
      when(
        () => repository1.resetRounds(playerId: "1", roomId: "1"),
      ).thenAnswer((_) async => []);
      await sut.resetRounds(playerId: "1", roomId: "1");

      verify(
        () => repository1.resetRounds(playerId: "1", roomId: "1"),
      ).called(1);
    });
  });
  // group("deleteScore", () {
  //   test("should call duelGameRepository.deleteScore once", () async {
  //     when(
  //       () => repository1.deleteScore(roomId: "1", roundId: "1"),
  //     ).thenAnswer((_) async => []);
  //     await sut.deleteScore(roomId: "1", roundNumber: 1);

  //     verify(
  //       () => repository1.deleteScore(roomId: "1", roundId: "1"),
  //     ).called(1);
  //   });
  // });
  group("deleteRoom", () {
    test("should call duelGameRepository.deleteRoom once", () async {
      when(
        () => repository1.deleteRoom(id: "1"),
      ).thenAnswer((_) async => []);
      await sut.deleteRoom(id: "1");

      verify(
        () => repository1.deleteRoom(id: "1"),
      ).called(1);
    });
  });
  group("addQtoFirebase", () {
    test("should call duelGameRepository.addQtoFirebase once", () async {
      when(
        () => repository1.addQtoFirebase(
            roomId: "1", categoryId: 1, roundNumber: 1),
      ).thenAnswer((_) async => []);
      await sut.addQtoFirebase(roomId: "1", categoryId: 1, roundNumber: 1);

      verify(
        () => repository1.addQtoFirebase(
            roomId: "1", categoryId: 1, roundNumber: 1),
      ).called(1);
    });
  });
  group("updatePlayersCount", () {
    test("should call duelGameRepository.updatePlayersCount once", () async {
      when(
        () => repository1.updatePlayersCount(roomId: "1", value: 1),
      ).thenAnswer((_) async => []);
      await sut.updatePlayersCount(roomId: "1", value: 1);

      verify(
        () => repository1.updatePlayersCount(roomId: "1", value: 1),
      ).called(1);
    });
  });
}
