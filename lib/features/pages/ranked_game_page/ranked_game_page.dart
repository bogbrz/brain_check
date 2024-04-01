import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/cubit%20copy/token_cubit_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RankedGamePage extends StatelessWidget {
  const RankedGamePage({
    required this.user,
    super.key,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final int hour = now.hour;
    final DateTime resetTime = DateTime(now.year, now.month, now.day, 23, 59);
    Duration difference = resetTime.difference(now);

    return BlocProvider(
        create: (context) => getIt<RankedGameCubit>()
          ..getRankingForUpdate(email: user!.email.toString()),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${AppLocalizations.of(context).timeToReset}: ${difference.inHours}:${difference.inMinutes.remainder(60)}",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 55,
                  color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocBuilder<RankedGameCubit, RankedGameState>(
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
                  return Center(
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01),
                            child: InfoWidget(
                              profile: state.profile[0],
                            )),
                        if (state.profile[0].lifes != 0) ...[
                          BlocBuilder<TokenCubitCubit, TokenCubitState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () async {
                                  await context
                                      .read<TokenCubitCubit>()
                                      .fetchToken();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => QuestionPage(
                                            players: null,
                                            roomId: null,
                                            isRanked: true,
                                            category: 0,
                                            difficulty: null.toString(),
                                            questionsNumber: 5,
                                            user: user,
                                            token: state.tokenModel.token
                                                .toString(),
                                            isDuel: false,
                                          )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.005),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.1),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              55,
                                          color: Colors.black)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context).play,
                                      style: GoogleFonts.bungee(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ] else ...[
                          Text(
                            AppLocalizations.of(context).comeBackTommorow,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                                color: Colors.black),
                          ),
                        ]
                      ],
                    ),
                  );
              }
            },
          ),
        ));
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.profile,
  });
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: MediaQuery.of(context).size.width / 55,
              color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Brain Check ${AppLocalizations.of(context).tokens}: ${profile.lifes}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                        child: const Image(
                          image: AssetImage("images/brain.png"),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${AppLocalizations.of(context).gamesPlayed}: ${profile.gamesPlayed}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${AppLocalizations.of(context).yourScore}: ${profile.points}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${AppLocalizations.of(context).questionsAmount}: 5",
                          style: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 40,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${AppLocalizations.of(context).category}: ${AppLocalizations.of(context).random}",
                          style: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 40,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${AppLocalizations.of(context).difficulty}: ${AppLocalizations.of(context).random}",
                          style: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 40,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
