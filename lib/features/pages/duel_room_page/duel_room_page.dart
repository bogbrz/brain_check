import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/duel_question_page.dart';

import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/player_one_widget.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/players_score.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/player_two_widget.dart';
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
  var category = null;

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
                        roundNumber: player.roundNumber,
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
                                  child: Text("Round number dupa"),
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        alignment: Alignment.center,
                        margin: EdgeInsetsDirectional.all(
                            MediaQuery.of(context).size.height * 0.01),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: MediaQuery.of(context).size.width / 55,
                                color: Colors.black)),
                        child: Column(
                          children: [
                            if (widget.user!.email.toString() ==
                                widget.roomModel.ownerMail.toString()) ...[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01))),
                                width: MediaQuery.of(context).size.width * 0.98,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                      child: DropdownButton<TriviaCategory>(
                                        isExpanded: true,
                                        items: categories
                                            .map((TriviaCategory categories) {
                                          return DropdownMenuItem<
                                                  TriviaCategory>(
                                              value: categories,
                                              child: Text(
                                                categories.name,
                                                style: GoogleFonts.bungee(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            65),
                                              ));
                                        }).toList(),
                                        onChanged:
                                            (TriviaCategory? selectedItem) {
                                          setState(() {
                                            category = selectedItem!;
                                          });
                                          for (final player in state.players) {
                                            context
                                                .read<DuelRoomPageCubit>()
                                                .updateCategory(
                                                    roomId: widget.roomModel.id,
                                                    playerId: player.id,
                                                    category:
                                                        selectedItem!.name);
                                          }
                                        },
                                        value: category,
                                        hint: Text('Select category'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01))),
                                width: MediaQuery.of(context).size.width * 0.98,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                        child: Text(state.playerOne.isNotEmpty
                                            ? state.playerOne[0].category
                                            : state.playerTwo.isNotEmpty
                                                ? state.playerTwo[0].category
                                                : "not chosen")),
                                  ),
                                ),
                              ),
                            ],
                            PlayersScore(
                              roomId: widget.roomModel.id,
                            )
                          ],
                        ),
                      ),
                      if (widget.user!.email.toString() ==
                          widget.roomModel.ownerMail.toString()) ...[
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: ElevatedButton(
                              onPressed:
                                  state.playerOne.isEmpty ||
                                          state.playerTwo.isEmpty
                                      ? null
                                      : state.playerOne[0].ready == false ||
                                              state.playerTwo[0].ready == false
                                          ? null
                                          : state.playerOne[0].startGame ||
                                                  state.playerTwo[0].startGame
                                              ? null
                                              : category == null
                                                  ? null
                                                  : () async {
                                                      for (final player
                                                          in state.players) {
                                                        if (player.email
                                                                .toString() ==
                                                            widget.roomModel
                                                                .ownerMail
                                                                .toString()) {
                                                          await context
                                                              .read<
                                                                  DuelRoomPageCubit>()
                                                              .addQtoFirebase(
                                                                  playerId:
                                                                      player.id,
                                                                  roundNumber:
                                                                      player
                                                                          .roundNumber,
                                                                  roomId: widget
                                                                      .roomModel
                                                                      .id,
                                                                  categoryId:
                                                                      category!
                                                                          .id)
                                                              .then((value) => context.read<DuelRoomPageCubit>().startGame(
                                                                  roomId: widget
                                                                      .roomModel
                                                                      .id,
                                                                  playerOneId: state
                                                                      .playerOne[
                                                                          0]
                                                                      .id,
                                                                  playerTwoId: state
                                                                      .playerTwo[0]
                                                                      .id,
                                                                  status: true));
                                                        }
                                                      }
                                                    },
                              child: Text(state.playerOne.isEmpty ||
                                      state.playerTwo.isEmpty
                                  ? "Not enough players"
                                  : state.playerOne[0].ready == false ||
                                          state.playerTwo[0].ready == false
                                      ? "Players are not ready"
                                      : 'Start Game')),
                        ),
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
