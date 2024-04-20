import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JoinPlayerOneWidget extends StatelessWidget {
  const JoinPlayerOneWidget(
      {super.key,
      required this.nickName,
      required this.id,
      required this.playerOne,
      required this.playerTwo,
      required this.user,
      required this.userPicture});

  final String nickName;
  final String id;
  final List<PlayerModel> playerOne;
  final List<PlayerModel> playerTwo;
  final User? user;
  final String? userPicture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (playerOne.isEmpty) ...[
          InkWell(
              onTap: playerTwo.isNotEmpty &&
                      playerTwo[0].email == user!.email.toString()
                  ? null
                  : () {
                      context.read<DuelRoomPageCubit>().joinPlayer(
                          userPicture: userPicture!,
                          email: user!.email.toString(),
                          nickName: nickName,
                          id: id,
                          playerNumber: 1);
                      context
                          .read<DuelRoomPageCubit>()
                          .updatePlayersCount(roomId: id, value: 1);
                    },
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child:
                      const Image(image: AssetImage("images/join_game.png")))),
          Text(
            "${AppLocalizations.of(context).joinPlayer}",
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 45),
          )
        ] else ...[
          Material(
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  25,
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
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(
                      playerOne[0].points.toString(),
                      style: GoogleFonts.bungee(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 15),
                    ),
                    CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.1,
                        backgroundImage:
                            Image.network(playerOne[0].userPicture).image),
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
                          playerOne[0].ready == true
                              ? "${AppLocalizations.of(context).ready}"
                              : "${AppLocalizations.of(context).notReady}",
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
