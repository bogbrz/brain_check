import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/result_page_route_model.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
     
      required this.model});
  final ResultPageRouteModel model;


  @override
  Widget build(BuildContext context) {
    int score = (model.answerOne +
            model.answerTwo +
            model.answerThree +
            model.answerFour +
            model.answerFive +
            model.answerSix +
            model.answerSeven +
            model.answerEight +
            model.answerNine +
            model.answerTen +
            model.answerEleven +
            model.answerTwelve +
            model.answerThirteen +
            model.answerFourteen +
            model.answerFithteen) *
        10;

    return BlocProvider(
      create: (context) => getIt<ResultCubit>()
        ..getRankingForUpdate(
          email: model.user!.email.toString(),
        ),
      child: Scaffold(body: BlocBuilder<ResultCubit, ResultState>(
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
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 27, 48),
                    Color.fromARGB(180, 66, 120, 255),
                  ],
                )),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Time: ${state.gameLenght}  ",
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        Text(
                          "${AppLocalizations.of(context).yourScore}: $score / ${model.questionAmount * 10}",
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        if (model.questionAmount == 1) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerOne == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          )
                        ] else if (model.questionAmount == 5) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerOne == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTwo == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerThree == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFour == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFive == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          )
                        ] else if (model.questionAmount == 10) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerOne == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTwo == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerThree == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFour == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFive == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerSix == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerSeven == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerEight == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerNine == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTen == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                        ] else if (model.questionAmount == 15) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerOne == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTwo == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerThree == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFour == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFive == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerSix == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerSeven == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerEight == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerNine == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTen == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.answerEleven == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerTwelve == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerThirteen == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFourteen == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                              model.answerFithteen == 1
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.cancel_rounded,
                                      color: Colors.red),
                            ],
                          ),
                        ],
                        Text(
                          "Total points: $totalPoints  ",
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height / 35),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(180, 66, 120, 255),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            onPressed: () {
                              if (model.gameType == GameType.duel) {
                                for (final player in model.players!) {
                                  if (player.email.toString() ==
                                      model.user!.email.toString()) {
                                    context.read<ResultCubit>().addRoundResults(
                                        roomId: model.roomId!,
                                        playerNumber: player.player,
                                        roundNumber: player.roundNumber,
                                        answerOne: model.answerOne,
                                        answerTwo: model.answerTwo,
                                        answerThree: model.answerThree,
                                        answerFour: model.answerFour,
                                        answerFive: model.answerFive);
                                    context.read<ResultCubit>().resetGameStatus(
                                        roomId: model.roomId!,
                                        status: false,
                                        playerId: player.id,
                                        points: totalPoints);
                                    if (model.gameStatus == true &&
                                        model.user!.email.toString() ==
                                            model.ownerEmail.toString()) {
                                      context
                                          .read<ResultCubit>()
                                          .deleteQuestions(
                                              roomId: model.roomId!,
                                              roundNumber: player.roundNumber);
                                    }
                                    context.pop();
                                  }
                                }
                              } else if (model.gameType == GameType.casual) {
                                context.pop();
                              } else {
                                context.read<ResultCubit>().updateRanking(
                                    points: totalPoints,
                                    profileId: state.profiles[0].id);
                                context.pop();
                              
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
