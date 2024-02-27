import 'dart:math';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/duel_page/cubit/duel_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({
    required this.nickName,
    required this.email,
    required this.id,
    required this.user,
    super.key,
  });
  final String email;
  final String nickName;
  final String id;
  final User? user;

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  var isReadyOne = false;
  var isReadyTwo = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelRoomPageCubit>(),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filledTonal(
                        onPressed: () {
                          if (state.player[0].email ==
                              widget.user!.email.toString()) {
                            context.read<DuelRoomPageCubit>().leaveRoom(
                                id: state.player[0].id, roomId: widget.id);
                          }

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.logout)),
                    IconButton.filledTonal(
                        onPressed: () {
                          if (widget.user!.email == widget.email) {
                            context
                                .read<DuelRoomPageCubit>()
                                .deleteRoom(id: widget.id);

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }
                        },
                        icon: Icon(Icons.delete)),
                  ],
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
                    builder: (context, state) {
                      context
                          .read<DuelRoomPageCubit>()
                          .playerInfo(id: widget.id, playerNumber: 1);
                      return Column(children: [
                        if (state.player
                            .where((element) => element.player == 1)
                            .isEmpty) ...[
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: InkWell(
                                  onTap: () {
                                    print("${state.player}, ${state.player}");
                                    context
                                        .read<DuelRoomPageCubit>()
                                        .joinPlayer(
                                            email: widget.email,
                                            nickName: widget.nickName,
                                            id: widget.id,
                                            playerNumber: 1);
                                  },
                                  child: Image(
                                      image:
                                          AssetImage("images/join_game.png")))),
                          Text(
                            "JOIN PLAYER 1",
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 40),
                          )
                        ] else ...[
                          InkWell(
                            onTap: () {
                              if (isReadyOne) {
                                setState(() {
                                  isReadyOne = false;
                                });
                              } else {
                                setState(() {
                                  isReadyOne = true;
                                });
                              }
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    state.player[0].player == 1
                                        ? state.player[0].nickName
                                        : state.player[1].nickName,
                                    style: GoogleFonts.bungee(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        isReadyOne ? "Ready" : "Not Ready",
                                        style: GoogleFonts.bungee(
                                            color: isReadyOne
                                                ? Colors.green
                                                : Colors.red,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40),
                                      ),
                                      Icon(
                                        isReadyOne
                                            ? Icons.check_box
                                            : Icons.cancel,
                                        color: isReadyOne
                                            ? Colors.green
                                            : Colors.red,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                      ]);
                    },
                  ),
                ),
                BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
                  builder: (context, state) {
                    context
                        .read<DuelRoomPageCubit>()
                        .playerInfo(id: widget.id, playerNumber: 2);

                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(children: [
                        if (state.player
                            .where((element) => element.player == 2)
                            .isEmpty) ...[
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: InkWell(
                                  onTap: () {
                                    context
                                        .read<DuelRoomPageCubit>()
                                        .joinPlayer(
                                            email: widget.email,
                                            nickName: widget.nickName,
                                            id: widget.id,
                                            playerNumber: 2);
                                  },
                                  child: Image(
                                      image:
                                          AssetImage("images/join_game.png")))),
                          Text(
                            "JOIN PLAYER 2",
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 40),
                          )
                        ] else ...[
                          InkWell(
                            onTap: () {
                              if (isReadyTwo) {
                                setState(() {
                                  isReadyTwo = false;
                                });
                              } else {
                                setState(() {
                                  isReadyTwo = true;
                                });
                              }
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    state.player[0].player == 2
                                        ? state.player[0].nickName
                                        : state.player[1].nickName,
                                    style: GoogleFonts.bungee(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        isReadyTwo ? "Ready" : "Not Ready",
                                        style: GoogleFonts.bungee(
                                            color: isReadyTwo
                                                ? Colors.green
                                                : Colors.red,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40),
                                      ),
                                      Icon(
                                        isReadyTwo
                                            ? Icons.check_box
                                            : Icons.cancel,
                                        color: isReadyTwo
                                            ? Colors.green
                                            : Colors.red,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                      ]),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
