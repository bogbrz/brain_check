import 'dart:math';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/duel_page/cubit/duel_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GameRoomPage extends StatelessWidget {
  const GameRoomPage({
    required this.nickName,
    required this.email,
    required this.id,
    super.key,
  });
  final String email;
  final String nickName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelRoomPageCubit>(),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton.filledTonal(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Row(
              children: [
                BlocBuilder<DuelRoomPageCubit, DuelRoomPageState>(
                  builder: (context, state) {
                    context.read<DuelRoomPageCubit>().playerOneInfo(id: id);

                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.playerOne.isEmpty) ...[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: InkWell(
                                      onTap: () {
                                        context
                                            .read<DuelRoomPageCubit>()
                                            .joinPlayerOne(
                                                email: email,
                                                nickName: nickName,
                                                id: id);
                                      },
                                      child: Image(
                                          image: AssetImage(
                                              "images/join_game.png")))),
                              Text(
                                "JOIN PLAYER 1",
                                style: GoogleFonts.bungee(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            40),
                              )
                            ] else ...[
                              Text(state.playerOne[0].nickName)
                            ]
                          ]),
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child:
                              Image(image: AssetImage("images/join_game.png"))),
                      Text(
                        "JOIN PLAYER 2",
                        style: GoogleFonts.bungee(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 40),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
