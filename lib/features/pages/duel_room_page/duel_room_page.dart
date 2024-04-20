import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

import 'package:brain_check/features/pages/duel_question_page/duel_question_page.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/non_owner_category_widget.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/player_one_widget.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/player_two_widget.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/players_score.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({
    required this.user,
    required this.roomModel,
    required this.nickName,
    required this.userPicture,
    super.key,
  });

  final User? user;
  final String nickName;
  final String? userPicture;
  final GameRoomModel roomModel;

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  var category = null;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DuelRoomPageCubit>()..playerInfo(id: widget.roomModel.id),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(body: BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
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
                  }
                }

                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 27, 48),
                      Color.fromARGB(180, 66, 120, 255),
                    ],
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton.filledTonal(
                                onPressed: () {
                                  if (widget.user!.email.toString() ==
                                      widget.roomModel.ownerMail.toString()) {
                                    context
                                        .read<DuelRoomPageCubit>()
                                        .deleteRoom(id: widget.roomModel.id);
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  } else if (state.players.isEmpty) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  } else {
                                    for (final player in state.players) {
                                      if (player.email ==
                                          widget.user!.email.toString()) {
                                        context
                                            .read<DuelRoomPageCubit>()
                                            .deleteScore(
                                                roomId: widget.roomModel.id,
                                                roundNumber:
                                                    player.roundNumber);

                                        for (final player in state.players) {
                                          context
                                              .read<DuelRoomPageCubit>()
                                              .resetRounds(
                                                  roomId: widget.roomModel.id,
                                                  playerId: player.id);
                                        }

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
                                      } else if (widget.user!.email
                                              .toString() !=
                                          player.email.toString()) {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      } else if (player.email ==
                                              widget.user!.email.toString() &&
                                          player.roundNumber == 5) {
                                        context
                                            .read<DuelRoomPageCubit>()
                                            .deleteRoom(
                                                id: widget.roomModel.id);
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  }
                                },
                                icon: const Icon(Icons.logout)),
                            Expanded(
                              child: Text(
                                "${widget.roomModel.nickName} ${AppLocalizations.of(context).playerRoom}",
                                style: GoogleFonts.bungee(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35),
                              ),
                            ),
                  
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: JoinPlayerOneWidget(
                                userPicture: widget.userPicture,
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
                                  child: Text(
                                      "${AppLocalizations.of(context).roundNumber} 1"),
                                ),
                              ] else if (player.email.toString() ==
                                  widget.roomModel.ownerMail.toString()) ...[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    '${AppLocalizations.of(context).roundNumber}\n${player.roundNumber}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.bungee(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                ),
                              ],
                            ],
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: JoinPlayerTwoWidget(
                                userPicture: widget.userPicture,
                        
                                nickName: widget.roomModel.nickName,
                                id: widget.roomModel.id,
                                playerTwo: state.playerTwo,
                                playerOne: state.playerOne,
                                user: widget.user,
                              ),
                            ),
                          ]),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        alignment: Alignment.center,
                        margin: EdgeInsetsDirectional.all(
                            MediaQuery.of(context).size.height * 0.01),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(180, 66, 120, 255),
                            ],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(
                          //     width: MediaQuery.of(context).size.width / 55,
                          //     color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            if (widget.user!.email.toString() ==
                                widget.roomModel.ownerMail.toString()) ...[
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(180, 66, 120, 255),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    border: Border.all(
                                        color: Colors.transparent,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.001)),
                                width: MediaQuery.of(context).size.width * 0.98,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
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
                                        hint: Text(
                                          '${AppLocalizations.of(context).selectCategory}',
                                          style: GoogleFonts.bungee(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              NonOwnerCategoryWidget(
                                  playerOne: state.playerOne,
                                  playerTwo: state.playerTwo)
                            ],
                            PlayersScore(
                              roomId: widget.roomModel.id,
                            ),
                            for (final player in state.players) ...[
                              if (player.roundNumber == 6 &&
                                  player.player == 1) ...[
                                if (state.playerOne[0].points >
                                    state.playerTwo[0].points) ...[
                                  Text(
                                    "${AppLocalizations.of(context).theWinnerIs} ${state.playerOne[0].nickName}",
                                    style: GoogleFonts.bungee(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35),
                                  )
                                ] else if (state.playerOne[0].points <
                                    state.playerTwo[0].points) ...[
                                  Text(
                                    "${AppLocalizations.of(context).theWinnerIs} ${state.playerTwo[0].nickName}",
                                    style: GoogleFonts.bungee(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35),
                                  )
                                ] else ...[
                                  Text(
                                    "${AppLocalizations.of(context).draw}",
                                    style: GoogleFonts.bungee(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35),
                                  )
                                ]
                              ]
                            ]
                          ],
                        ),
                      ),
                      if (widget.user!.email.toString() ==
                          widget.roomModel.ownerMail.toString()) ...[
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: state.playerOne.isEmpty ||
                                        state.playerTwo.isEmpty
                                    ? [
                                        Color.fromARGB(255, 82, 78, 78),
                                        Color.fromARGB(180, 0, 0, 0),
                                      ]
                                    : state.playerOne[0].ready == false ||
                                            state.playerTwo[0].ready == false
                                        ? [
                                            Color.fromARGB(255, 82, 78, 78),
                                            Color.fromARGB(180, 0, 0, 0),
                                          ]
                                        : state.playerOne[0].startGame ||
                                                state.playerTwo[0].startGame
                                            ? [
                                                Color.fromARGB(255, 82, 78, 78),
                                                Color.fromARGB(180, 0, 0, 0),
                                              ]
                                            : category == null
                                                ? [
                                                    Color.fromARGB(
                                                        255, 82, 78, 78),
                                                    Color.fromARGB(
                                                        180, 0, 0, 0),
                                                  ]
                                                : state.playerOne[0]
                                                            .roundNumber ==
                                                        6
                                                    ? [
                                                        Color.fromARGB(
                                                            255, 82, 78, 78),
                                                        Color.fromARGB(
                                                            180, 0, 0, 0),
                                                      ]
                                                    : [
                                                        Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        Color.fromARGB(
                                                            180, 66, 120, 255),
                                                      ],
                              ),
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent),
                                onPressed:
                                    state.playerOne.isEmpty ||
                                            state.playerTwo.isEmpty
                                        ? null
                                        : state.playerOne[0].ready == false ||
                                                state.playerTwo[0].ready ==
                                                    false
                                            ? null
                                            : state.playerOne[0].startGame ||
                                                    state.playerTwo[0].startGame
                                                ? null
                                                : category == null
                                                    ? null
                                                    : state.playerOne[0]
                                                                .roundNumber ==
                                                            6
                                                        ? null
                                                        : () async {
                                                            for (final player
                                                                in state
                                                                    .players) {
                                                              if (player.email
                                                                      .toString() ==
                                                                  widget
                                                                      .roomModel
                                                                      .ownerMail
                                                                      .toString()) {
                                                                await context.read<DuelRoomPageCubit>().addQtoFirebase(
                                                                    roundNumber:
                                                                        player
                                                                            .roundNumber,
                                                                    roomId: widget
                                                                        .roomModel
                                                                        .id,
                                                                    categoryId:
                                                                        category!
                                                                            .id);
                                                              }
                                                              context.read<DuelRoomPageCubit>().startGame(
                                                                  roomId: widget
                                                                      .roomModel
                                                                      .id,
                                                                  playerOneId:
                                                                      state
                                                                          .players[
                                                                              0]
                                                                          .id,
                                                                  playerTwoId:
                                                                      state
                                                                          .players[
                                                                              1]
                                                                          .id,
                                                                  status: true);
                                                            }
                                                          },
                                child: Text(
                                  state.playerOne.isEmpty ||
                                          state.playerTwo.isEmpty
                                      ? "${AppLocalizations.of(context).notEnoughPlayers}"
                                      : state.playerOne[0].roundNumber == 6
                                          ? "${AppLocalizations.of(context).gameOver}"
                                          : state.playerOne[0].ready == false ||
                                                  state.playerTwo[0].ready ==
                                                      false
                                              ? "${AppLocalizations.of(context).playersNotReady}"
                                              : '${AppLocalizations.of(context).startGame}',
                                  style: GoogleFonts.bungee(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35),
                                )),
                          ),
                        ),
                      ]
                    ],
                  ),
                );
            }
          },
        )),
      ),
    );
  }
}
