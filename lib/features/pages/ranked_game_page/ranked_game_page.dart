import 'package:brain_check/app/core/enums/enums.dart';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class RankedGamePage extends StatelessWidget {
  RankedGamePage({
    required this.user,
    required this.profileModel,
    super.key,
  });

  final User? user;
  final ProfileModel profileModel;

  final CountdownController controller = CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();

    return BlocProvider(
        create: (context) => getIt<RankedGameCubit>()
          ..getRankingForUpdate(email: user!.email.toString()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocConsumer<RankedGameCubit, RankedGameState>(
            listener: (context, state) {
              DateTime lastLogin = DateTime.parse(
                  state.profile[0].lastLogIn.toDate().toString());

              Duration difference = dateTime.difference(lastLogin);
              print(difference.inDays);

              if (difference.inDays >= 1) {
                context.read<RankedGameCubit>().updateLifes(
                      lastLogin: DateTime.now(),
                      profileId: state.profile[0].id,
                    );
              }
            },
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
                  DateTime lastLogin = DateTime.parse(
                      state.profile[0].lastLogIn.toDate().toString());
                  DateTime resetDay = lastLogin.add(Duration(hours: 24));

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
                          InkWell(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => QuestionPage(
                                        profileModel: profileModel,
                                        roomId: null,
                                        gameType: GameType.ranked,
                                        category: null,
                                        difficulty: '',
                                        questionsAmount: 5,
                                        user: user,
                                      )));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.005),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height * 0.1),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: MediaQuery.of(context).size.width /
                                          55,
                                      color: Colors.black)),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).play,
                                  style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ] else ...[
                          Text(
                            "${AppLocalizations.of(context).timeToReset}:",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                                color: Colors.black),
                          ),
                          TimerCountdown(
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: resetDay,
                            timeTextStyle: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 20,
                            ),
                            colonsTextStyle: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 30,
                            ),
                            enableDescriptions: false,
                            onEnd: () {
                              context.read<RankedGameCubit>().updateLifes(
                                    lastLogin: DateTime.now(),
                                    profileId: state.profile[0].id,
                                  );
                            },
                          )
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
