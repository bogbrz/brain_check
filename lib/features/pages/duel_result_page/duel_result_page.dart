import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_result_page/cubit/duel_result_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    required this.gameType,
    required this.questionAmount,
    required this.answerSix,
    required this.answerSeven,
    required this.answerEight,
    required this.answerNine,
    required this.answerTen,
    required this.answerEleven,
    required this.answerTwelve,
    required this.answerThirteen,
    required this.answerFourteen,
    required this.answerFithteen,
  });
  final String? roomId;
  final List<PlayerModel>? players;
  final User? user;

  final String? ownerEmail;
  final int answerOne;
  final int answerTwo;
  final int answerThree;
  final int answerFour;
  final int answerFive;
  final int answerSix;
  final int answerSeven;
  final int answerEight;
  final int answerNine;
  final int answerTen;
  final int answerEleven;
  final int answerTwelve;
  final int answerThirteen;
  final int answerFourteen;
  final int answerFithteen;
  final bool? gameStatus;
  final GameType gameType;

  final int questionAmount;

  @override
  Widget build(BuildContext context) {
    int score = (answerOne +
            answerTwo +
            answerThree +
            answerFour +
            answerFive +
            answerSix +
            answerSeven +
            answerEight +
            answerNine +
            answerTen +
            answerEleven +
            answerTwelve +
            answerThirteen +
            answerFourteen +
            answerFithteen) *
        10;

    return BlocProvider(
      create: (context) => getIt<DuelResultCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: Scaffold(body: BlocBuilder<DuelResultCubit, DuelResultState>(
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
              int pointsDeductionForTime = state.gameDuration!.inSeconds <= 30
                  ? 0
                  : ((state.gameDuration!.inSeconds) ~/ 5);
              int totalPoints = score == 0
                  ? 0
                  : (score - pointsDeductionForTime) < 0
                      ? 0
                      : score - pointsDeductionForTime;

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
                child: Center(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Time: ${state.gameLenght}  ",
                          style: GoogleFonts.bungee(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        Text(
                          "${AppLocalizations.of(context).yourScore}: ${score} / ${questionAmount * 10}",
                          style: GoogleFonts.bungee(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        if (questionAmount == 1) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerOne == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          )
                        ] else if (questionAmount == 5) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerOne == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTwo == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerThree == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFour == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFive == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          )
                        ] else if (questionAmount == 10) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerOne == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTwo == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerThree == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFour == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFive == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerSix == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerSeven == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerEight == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerNine == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTen == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                        ] else if (questionAmount == 15) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerOne == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTwo == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerThree == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFour == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFive == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerSix == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerSeven == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerEight == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerNine == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTen == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              answerEleven == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerTwelve == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerThirteen == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFourteen == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              answerFithteen == 1
                                  ? Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                        ],
                        Text(
                          "Total points: $totalPoints  ",
                          style: GoogleFonts.bungee(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (gameType == GameType.duel) {
                              for (final player in players!) {
                                if (player.email.toString() ==
                                    user!.email.toString()) {
                                  context
                                      .read<DuelResultCubit>()
                                      .addRoundResults(
                                          roomId: roomId!,
                                          playerNumber: player.player,
                                          roundNumber: player.roundNumber,
                                          answerOne: answerOne,
                                          answerTwo: answerTwo,
                                          answerThree: answerThree,
                                          answerFour: answerFour,
                                          answerFive: answerFive);
                                  context
                                      .read<DuelResultCubit>()
                                      .resetGameStatus(
                                          roomId: roomId!,
                                          status: false,
                                          playerId: player.id,
                                          points: totalPoints);
                                  if (gameStatus == true) {
                                    context
                                        .read<DuelResultCubit>()
                                        .deleteQuestions(
                                            roomId: roomId!,
                                            roundNumber: player.roundNumber);
                                  }
                                }
                              }
                            } else if (gameType == GameType.casual) {
                              Navigator.of(context).pop();
                            } else {
                              context.read<DuelResultCubit>().updateRanking(
                                  points: totalPoints,
                                  profileId: state.profiles[0].id);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context).backToLobby,
                            style: GoogleFonts.bungee(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      )),
    );
  }
}
