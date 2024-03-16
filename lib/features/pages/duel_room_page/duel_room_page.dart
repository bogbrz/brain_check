import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/duel_question_page.dart';

import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({
    required this.user,
    required this.roomModel,
    required this.nickName,
    super.key,
  });

  final User? user;
  final String nickName;

  final GameRoomModel roomModel;

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  @override
  TriviaCategory? category;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DuelRoomPageCubit>()..playerInfo(id: widget.roomModel.id),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(body: SafeArea(
          child: BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
            builder: (context, state) {
              final categories = state.categories;
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
                    if (player.email == widget.user!.email.toString() &&
                        player.startGame == true) {
                      return DuelQuestionPage(
                        roomId: widget.roomModel.id,
                        players: state.players,
                        user: widget.user,
                        ownerEmail: widget.roomModel.ownerMail,
                      );
                    } else if (state.players.length == 2 &&
                        state.playerOne[0].email.toString() !=
                            widget.user!.email.toString() &&
                        state.playerTwo[0].email.toString() !=
                            widget.user!.email.toString()) {
                      Navigator.of(context).pop();
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
                                        widget.user!.email.toString()) {
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .updatePlayersCount(
                                              roomId: widget.roomModel.id,
                                              value: -1);
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .leaveRoom(
                                              id: player.id,
                                              roomId: widget.roomModel.id);

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    }
                                    if (player.email.toString() ==
                                        widget.roomModel.ownerMail.toString()) {
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .resetRounds(
                                              roomId: widget.roomModel.id,
                                              playerId: player.id);
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.logout)),
                          Text(
                            "${widget.roomModel.nickName}'s room",
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                          ),
                          IconButton.filledTonal(
                              onPressed: widget.user!.email !=
                                      widget.roomModel.ownerMail
                                  ? null
                                  : () {
                                      context
                                          .read<DuelRoomPageCubit>()
                                          .deleteRoom(id: widget.roomModel.id);

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
                                nickName: widget.nickName,
                                id: widget.roomModel.id,
                                playerOne: state.playerOne,
                                playerTwo: state.playerTwo,
                                user: widget.user,
                              ),
                            ),
                            for (final player in state.players) ...[
                              if (state.players.isEmpty) ...[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Text("Round number 0"),
                                ),
                              ] else if (player.email.toString() ==
                                  widget.roomModel.ownerMail.toString()) ...[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Text(
                                      "Round number ${player.roundNumber}"),
                                ),
                              ],
                            ],
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: JoinPlayerTwoWidget(
                                nickName: widget.roomModel.nickName,
                                id: widget.roomModel.id,
                                playerTwo: state.playerTwo,
                                playerOne: state.playerOne,
                                user: widget.user,
                              ),
                            ),
                          ]),
                      if (widget.user!.email.toString() ==
                          widget.roomModel.ownerMail.toString()) ...[
                        DropdownButton<TriviaCategory>(
                          items: categories.map((TriviaCategory categories) {
                            return DropdownMenuItem<TriviaCategory>(
                                value: categories,
                                child: Text(categories.name));
                          }).toList(),
                          onChanged: (TriviaCategory? selectedItem) {
                            setState(() {
                              category = selectedItem!;
                            });
                          },
                          value: category,
                        ),
                        ElevatedButton(
                            onPressed: state.playerOne.isEmpty ||
                                    state.playerTwo.isEmpty
                                ? null
                                : state.playerOne[0].ready == false ||
                                        state.playerTwo[0].ready == false
                                    ? null
                                    : state.playerOne[0].startGame ||
                                            state.playerTwo[0].startGame
                                        ? null
                                        : () {
                                            for (final player
                                                in state.players) {
                                              if (player.email.toString() ==
                                                      widget.roomModel.ownerMail
                                                          .toString() &&
                                                  player.questionsAdded ==
                                                      false) {
                                                context
                                                    .read<DuelRoomPageCubit>()
                                                    .addQtoFirebase(
                                                        roomId: widget
                                                            .roomModel.id);
                                              }
                                            }
                                            context
                                                .read<DuelRoomPageCubit>()
                                                .startGame(
                                                    roomId: widget.roomModel.id,
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
