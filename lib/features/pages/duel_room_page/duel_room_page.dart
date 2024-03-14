import 'dart:developer';

import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/duel_question_page.dart';

import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GameRoomPage extends StatelessWidget {
  const GameRoomPage({
    required this.nickName,
    required this.email,
    required this.id,
    required this.user,
    required this.roomName,
    super.key,
  });
  final String email;
  final String nickName;
  final String id;
  final User? user;
  final String roomName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelRoomPageCubit>()..playerInfo(id: id),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const InitialStateWidget();
                case Status.loading:
                  return const LoadingStateWidget();
                case Status.error:
                  return ErrorStateWidget(
                      errorMessage: state.errorMessage.toString());
                case Status.success:
                  for (final player in state.players) {
                    if (player.email == user!.email.toString() &&
                        player.startGame == true) {
                      return DuelQuestionPage(
                        roomId: id,
                        players: state.players,
                        user: user,
                        ownerEmail: email,
                      );
                    }
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton.filledTonal(
                              onPressed: () {
                                if (state.players.isEmpty) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                } else {
                                  for (final player in state.players) {
                                    if (player.email.toString() ==
                                        user!.email.toString()) {
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .leaveRoom(id: player.id, roomId: id);
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .updatePlayersCount(
                                              roomId: id, value: -1);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.logout)),
                          Text(
                            "$roomName's room",
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                          ),
                          IconButton.filledTonal(
                              onPressed: user!.email != email
                                  ? null
                                  : () {
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .deleteRoom(id: id);

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: JoinPlayerOneWidget(
                                nickName: nickName,
                                id: id,
                                playerOne: state.playerOne,
                                playerTwo: state.playerTwo,
                                user: user,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Text(state.players.isEmpty
                                  ? "Round 1"
                                  : state.playerOne[0].email.toString() ==
                                          email.toString()
                                      ? "Round ${state.playerOne[0].roundNumber}"
                                      : "Round ${state.playerTwo[0].roundNumber}"),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: JoinPlayerTwoWidget(
                                nickName: nickName,
                                id: id,
                                playerTwo: state.playerTwo,
                                playerOne: state.playerOne,
                                user: user,
                              ),
                            ),
                          ]),
                      if (user!.email.toString() == email.toString()) ...[
                        ElevatedButton(
                            onPressed: state.playerOne.isEmpty ||
                                    state.playerTwo.isEmpty
                                ? null
                                : state.playerOne[0].ready == false ||
                                        state.playerTwo[0].ready == false
                                    ? null
                                    : () {
                                        for (final player in state.players) {
                                          if (player.email.toString() ==
                                                  email.toString() &&
                                              player.questionsAdded == false) {
                                            context
                                                .read<DuelRoomPageCubit>()
                                                .addQtoFirebase(roomId: id);
                                          }
                                        }
                                        context
                                            .read<DuelRoomPageCubit>()
                                            .startGame(
                                                roomId: id,
                                                playerOneId:
                                                    state.playerOne[0].id,
                                                playerTwoId:
                                                    state.playerTwo[0].id,
                                                status: true);
                                      },
                            child: Text(state.playerOne.isEmpty ||
                                    state.playerTwo.isEmpty
                                ? "Not enough players"
                                : state.playerOne[0].ready == false ||
                                        state.playerTwo[0].ready == false
                                    ? "Players are not ready"
                                    : 'Start Game')),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       context
                        //           .read<DuelRoomPageCubit>()
                        //           .addQtoFirebase(roomId: id);
                        //     },
                        //     child: Text("Test"))
                      ] else ...[
                        Text("WAIT FOR ROOM OWNER TO START")
                      ]
                    ],
                  );
              }
            },
          ),
        )),
      ),
    );
  }
}

class JoinPlayerTwoWidget extends StatelessWidget {
  const JoinPlayerTwoWidget({
    super.key,
    required this.nickName,
    required this.id,
    required this.playerTwo,
    required this.user,
    required this.playerOne,
  });

  final String nickName;
  final String id;
  final List<PlayerModel> playerTwo;
  final List<PlayerModel> playerOne;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (playerTwo.isEmpty) ...[
          SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                  onTap: playerOne.isNotEmpty &&
                          playerOne[0].email == user!.email.toString()
                      ? null
                      : () {
                          context.read<DuelRoomPageCubit>().joinPlayer(
                              email: user!.email.toString(),
                              nickName: nickName,
                              id: id,
                              playerNumber: 2);
                          context
                              .read<DuelRoomPageCubit>()
                              .updatePlayersCount(roomId: id, value: 1);
                        },
                  child:
                      const Image(image: AssetImage("images/join_game.png")))),
          Text(
            "JOIN PLAYER 2",
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 40),
          )
        ] else ...[
          Material(
            clipBehavior: Clip.hardEdge,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                borderSide: const BorderSide(color: Colors.transparent)),
            child: InkWell(
              onTap: playerTwo[0].email == user!.email
                  ? () {
                      playerTwo[0].ready == true
                          ? context.read<DuelRoomPageCubit>().readyStatus(
                              id: playerTwo[0].id, ready: false, roomId: id)
                          : context.read<DuelRoomPageCubit>().readyStatus(
                              id: playerTwo[0].id, ready: true, roomId: id);
                    }
                  : null,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      playerTwo[0].points.toString(),
                      style: GoogleFonts.bungee(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 15),
                    ),
                    Text(
                      playerTwo[0].nickName,
                      style: GoogleFonts.bungee(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          playerTwo[0].ready == true ? "Ready" : "Not ready",
                          style: GoogleFonts.bungee(
                              color: playerTwo[0].ready == true
                                  ? Colors.green
                                  : Colors.red,
                              fontSize:
                                  MediaQuery.of(context).size.height / 40),
                        ),
                        Icon(
                            playerTwo[0].ready == true
                                ? Icons.check_box
                                : Icons.cancel,
                            color: playerTwo[0].ready == true
                                ? Colors.green
                                : Colors.red)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}

class JoinPlayerOneWidget extends StatelessWidget {
  const JoinPlayerOneWidget({
    super.key,
    required this.nickName,
    required this.id,
    required this.playerOne,
    required this.playerTwo,
    required this.user,
  });

  final String nickName;
  final String id;
  final List<PlayerModel> playerOne;
  final List<PlayerModel> playerTwo;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (playerOne.isEmpty) ...[
          SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                  onTap: playerTwo.isNotEmpty &&
                          playerTwo[0].email == user!.email.toString()
                      ? null
                      : () {
                          context.read<DuelRoomPageCubit>().joinPlayer(
                              email: user!.email.toString(),
                              nickName: nickName,
                              id: id,
                              playerNumber: 1);
                          context
                              .read<DuelRoomPageCubit>()
                              .updatePlayersCount(roomId: id, value: 1);
                        },
                  child:
                      const Image(image: AssetImage("images/join_game.png")))),
          Text(
            "JOIN PLAYER 1",
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 40),
          )
        ] else ...[
          Material(
            clipBehavior: Clip.hardEdge,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                borderSide: const BorderSide(color: Colors.transparent)),
            child: InkWell(
              onTap: playerOne[0].email != user!.email
                  ? null
                  : () {
                      playerOne[0].ready == true
                          ? context.read<DuelRoomPageCubit>().readyStatus(
                              id: playerOne[0].id, ready: false, roomId: id)
                          : context.read<DuelRoomPageCubit>().readyStatus(
                              id: playerOne[0].id, ready: true, roomId: id);
                    },
              child: Container(
                child: Column(
                  children: [
                    Text(
                      playerOne[0].points.toString(),
                      style: GoogleFonts.bungee(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 15),
                    ),
                    Text(
                      playerOne[0].nickName,
                      style: GoogleFonts.bungee(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          playerOne[0].ready == true ? "Ready" : "Not ready",
                          style: GoogleFonts.bungee(
                              color: playerOne[0].ready == true
                                  ? Colors.green
                                  : Colors.red,
                              fontSize:
                                  MediaQuery.of(context).size.height / 40),
                        ),
                        Icon(
                            playerOne[0].ready == true
                                ? Icons.check_box
                                : Icons.cancel,
                            color: playerOne[0].ready == true
                                ? Colors.green
                                : Colors.red)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
