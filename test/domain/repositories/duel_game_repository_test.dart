import 'package:brain_check/data_sources/authentication_data_source.dart';
import 'package:brain_check/data_sources/duel_game_data_source.dart';
import 'package:brain_check/data_sources/questions_data_source.dart';
import 'package:brain_check/domain/models/question_model.dart';
import 'package:brain_check/domain/models/token_model.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDuelGameDataSource extends Mock implements DuelGameDataSource {}

class MockQuestionDataSource extends Mock implements QuestionDataSource {}

////
///TO DO ADDQTOFIREBASE
///
void main() {
  late DuelGameRepository sut;
  late MockDuelGameDataSource dataSource1;
  late MockQuestionDataSource dataSource2;

  setUp(() {
    dataSource1 = MockDuelGameDataSource();
    dataSource2 = MockQuestionDataSource();

    sut = DuelGameRepository(
        questionDataSource: dataSource2, duelGameDataSource: dataSource1);
  });

  group("createRoom", () {
    test("should call duelGameDataSource.createRoom() method once", () async {
      when(
        () => dataSource1.createRoom(
            name: "name", password: "password", nickName: "nickName"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.createRoom(
          name: "name", password: "password", nickName: "nickName");

      verify(
        () => dataSource1.createRoom(
            name: "name", password: "password", nickName: "nickName"),
      ).called(1);
    });
  });
  // group("addQtoFirebase", () {
  //   test("should callduelGameDataSource.addQtoFirebase() method once",
  //       () async {
  //     when(() => dataSource2.getToken()).thenAnswer((_) async => TokenModel(
  //         response: 1, responeMessage: "responeMessage", token: "1"));
  //     when(() => dataSource2.getListofQuestions("easy", 9, 1, "1"))
  //         .thenAnswer((_) async => Questions(responseCode: 0, results: [
  //               QuestionModel(
  //                   type: "type",
  //                   difficulty: "easy",
  //                   category: "category",
  //                   question: "question",
  //                   correctAnswer: "correctAnswer",
  //                   incorrectAnswers: ["incorrectAnswers"])
  //             ]));
  //     await sut.addQtoFirebase(roomId: "", categoryId: 1, roundNumber: 1);
  //     verify(
  //       () => dataSource1.addQtoFirebase(
  //           roomId: "",
  //           roundNumber: 1,
  //           questionModel: QuestionModel(
  //               type: "type",
  //               difficulty: "easy",
  //               category: "category",
  //               question: "question",
  //               correctAnswer: "correctAnswer",
  //               incorrectAnswers: ["incorrectAnswers"])),
  //     ).called(1);
  //     verify(
  //       () => dataSource2.getToken(),
  //     ).called(1);
  //     verify(
  //       () => dataSource2.getListofQuestions("easy", 1, 1, "1"),
  //     ).called(1);
  //   });
  // });
  group("resetGameStatus", () {
    test("should call duelGameDataSource.resetGameStatus() method once",
        () async {
      when(
        () => dataSource1.resetGameStatus(
            roomId: "name", status: true, playerId: "nickName", points: 1),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.resetGameStatus(
          roomId: "name", status: true, playerId: "nickName", points: 1);

      verify(
        () => dataSource1.resetGameStatus(
            roomId: "name", status: true, playerId: "nickName", points: 1),
      ).called(1);
    });
  });
  group("updatePlayersCount", () {
    test("should call duelGameDataSource.updatePlayersCount() method once",
        () async {
      when(
        () => dataSource1.updatePlayersCount(
          roomId: "name",
          value: 1,
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.updatePlayersCount(
        roomId: "name",
        value: 1,
      );

      verify(
        () => dataSource1.updatePlayersCount(
          roomId: "name",
          value: 1,
        ),
      ).called(1);
    });
  });
  group("readyStatus", () {
    test("should call duelGameDataSource.readyStatus() method once", () async {
      when(
        () => dataSource1.readyStatus(roomId: "name", id: "00", ready: true),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.readyStatus(roomId: "name", id: "00", ready: true);

      verify(
        () => dataSource1.readyStatus(roomId: "name", id: "00", ready: true),
      ).called(1);
    });
  });
  group("deleteScore", () {
    test("should call duelGameDataSource.deleteScore() method once", () async {
      when(
        () => dataSource1.deleteScore(
          roomId: "name",
          roundId: "1",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.deleteScore(
        roomId: "name",
        roundId: "1",
      );

      verify(
        () => dataSource1.deleteScore(
          roomId: "name",
          roundId: "1",
        ),
      ).called(1);
    });
  });
  group("addRoundResults", () {
    test("should call duelGameDataSource.addRoundResults() method once",
        () async {
      when(
        () => dataSource1.addRoundResults(
          roomId: "name",
          playerNumber: 1,
          roundNumber: 1,
          answerFive: 1,
          answerFour: 1,
          answerOne: 1,
          answerThree: 1,
          answerTwo: 1,
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.addRoundResults(
        roomId: "name",
        playerNumber: 1,
        roundNumber: 1,
        answerFive: 1,
        answerFour: 1,
        answerOne: 1,
        answerThree: 1,
        answerTwo: 1,
      );

      verify(
        () => dataSource1.addRoundResults(
          roomId: "name",
          playerNumber: 1,
          roundNumber: 1,
          answerFive: 1,
          answerFour: 1,
          answerOne: 1,
          answerThree: 1,
          answerTwo: 1,
        ),
      ).called(1);
    });
  });
  group("startGame", () {
    test("should call duelGameDataSource.startGame() method once", () async {
      when(
        () => dataSource1.startGame(
          roomId: "name",
          status: true,
          playerOneId: "1",
          playerTwoId: "2",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.startGame(
        roomId: "name",
        status: true,
        playerOneId: "1",
        playerTwoId: "2",
      );

      verify(
        () => dataSource1.startGame(
          roomId: "name",
          status: true,
          playerOneId: "1",
          playerTwoId: "2",
        ),
      ).called(1);
    });
  });
  group("joinPlayer", () {
    test("should call duelGameDataSource.joinPlayer() method once", () async {
      when(
        () => dataSource1.joinPlayer(
          email: "1",
          nickName: "1",
          id: "1",
          playerNumber: 1,
          userPicture: "1",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.joinPlayer(
        email: "1",
        nickName: "1",
        id: "1",
        playerNumber: 1,
        userPicture: "1",
      );

      verify(
        () => dataSource1.joinPlayer(
          email: "1",
          nickName: "1",
          id: "1",
          playerNumber: 1,
          userPicture: "1",
        ),
      ).called(1);
    });
  });
  group("leaveRoom", () {
    test("should call duelGameDataSource.leaveRoom() method once", () async {
      when(
        () => dataSource1.leaveRoom(
          roomId: "name",
          id: "1",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.leaveRoom(
        roomId: "name",
        id: "1",
      );

      verify(
        () => dataSource1.leaveRoom(
          roomId: "name",
          id: "1",
        ),
      ).called(1);
    });
  });
  group("resetRounds", () {
    test("should call duelGameDataSource.resetRounds() method once", () async {
      when(
        () => dataSource1.resetRounds(
          roomId: "name",
          playerId: "1",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.resetRounds(
        roomId: "name",
        playerId: "1",
      );

      verify(
        () => dataSource1.resetRounds(
          roomId: "name",
          playerId: "1",
        ),
      ).called(1);
    });
  });
  group("updateCategory", () {
    test("should call duelGameDataSource.updateCategory() method once",
        () async {
      when(
        () => dataSource1.updateCategory(
            roomId: "name", playerId: "1", category: "1"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.updateCategory(roomId: "name", playerId: "1", category: "1");

      verify(
        () => dataSource1.updateCategory(
            roomId: "name", playerId: "1", category: "1"),
      ).called(1);
    });
  });
  group("deleteQuestions", () {
    test("should call duelGameDataSource.deleteQuestions() method once",
        () async {
      when(
        () => dataSource1.deleteQuestions(
          roomId: "name",
          roundNumber: 1,
          questionId: "1",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.deleteQuestions(
        roomId: "name",
        roundNumber: 1,
        questionId: "1",
      );

      verify(
        () => dataSource1.deleteQuestions(
          roomId: "name",
          roundNumber: 1,
          questionId: "1",
        ),
      ).called(1);
    });
  });

  group("deleteRoom", () {
    test("should call duelGameDataSource.deleteRoom() method once", () async {
      when(
        () => dataSource1.deleteRoom(
          id: "name",
        ),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.deleteRoom(
        id: "name",
      );

      verify(
        () => dataSource1.deleteRoom(
          id: "name",
        ),
      ).called(1);
    });
  });
}
