import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_result_page/cubit/duel_result_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DuelResultPage extends StatelessWidget {
  const DuelResultPage(
      {required this.roomId,
      super.key,
      required this.players,
      required this.user,
      required this.points,
      required this.ownerEmail, required this.answerOne, required this.answerTwo, required this.answerThree, required this.answerFour, required this.answerFive});
  final String? roomId;
  final List<PlayerModel>? players;
  final User? user;
  final int points;
  final String ownerEmail;
  final int answerOne;
  final int answerTwo;
  final int answerThree;
  final int answerFour;
  final int answerFive;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelResultCubit>(),
      child: Scaffold(body: BlocBuilder<DuelResultCubit, DuelResultState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text("POINTS: ${points}"),
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
                            answerFive:
                            answerFive);
                        context.read<DuelResultCubit>().resetGameStatus(
                            roomId: roomId!,
                            status: false,
                            playerId: player.id,
                            points: points);

                        
                      }
                    }
                  },
                  child: Text("END OF DUEL"),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
