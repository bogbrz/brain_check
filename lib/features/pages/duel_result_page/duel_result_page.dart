import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_result_page/cubit/duel_result_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DuelResultPage extends StatelessWidget {
  DuelResultPage({
    required this.roomId,
    super.key,
    required this.players,
    required this.user,
    required this.ownerEmail,
    required this.answerOne,
    required this.answerTwo,
    required this.answerThree,
    required this.answerFour,
    required this.answerFive,
    required this.gameStatus,
  });
  final String? roomId;
  final List<PlayerModel>? players;
  final User? user;

  final String ownerEmail;
  final int answerOne;
  final int answerTwo;
  final int answerThree;
  final int answerFour;
  final int answerFive;
  final bool gameStatus;

  @override
  Widget build(BuildContext context) {
    int score = answerOne + answerTwo + answerThree + answerFour + answerFive;
    return BlocProvider(
      create: (context) => getIt<DuelResultCubit>(),
      child: Scaffold(body: BlocBuilder<DuelResultCubit, DuelResultState>(
        builder: (context, state) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).yourScore}: ${score} ${AppLocalizations.of(context).points}",
                    style: GoogleFonts.bungee(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 35),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        answerOne == 1
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.cancel_rounded, color: Colors.red),
                        answerTwo == 1
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.cancel_rounded, color: Colors.red),
                        answerThree == 1
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.cancel_rounded, color: Colors.red),
                        answerFour == 1
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.cancel_rounded, color: Colors.red),
                        answerFive == 1
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.cancel_rounded, color: Colors.red),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      for (final player in players!) {
                        if (player.email.toString() == user!.email.toString()) {
                          context.read<DuelResultCubit>().addRoundResults(
                              roomId: roomId!,
                              playerNumber: player.player,
                              roundNumber: player.roundNumber,
                              answerOne: answerOne,
                              answerTwo: answerTwo,
                              answerThree: answerThree,
                              answerFour: answerFour,
                              answerFive: answerFive);
                          context.read<DuelResultCubit>().resetGameStatus(
                              roomId: roomId!,
                              status: false,
                              playerId: player.id,
                              points: score);
                          if (gameStatus == true) {
                            context.read<DuelResultCubit>().deleteQuestions(
                                roomId: roomId!,
                                roundNumber: player.roundNumber);
                          }
                        }
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).backToLobby,
                      style: GoogleFonts.bungee(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}