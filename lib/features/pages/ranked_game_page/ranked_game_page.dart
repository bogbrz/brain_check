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
import 'package:intl/intl.dart';

class RankedGamePage extends StatelessWidget {
  RankedGamePage({
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
              "Time to reset tokens: ${difference.inHours}:${difference.inMinutes.remainder(60)}",
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
                  return InitialStateWidget();
                case Status.loading:
                  return LoadingStateWidget();
                case Status.error:
                  return ErrorStateWidget(
                      errorMessage: state.errorMessage.toString());
                case Status.success:
                  return Center(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10),
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
                                          isRanked: true,
                                          category: 0,
                                          difficulty: null.toString(),
                                          questionsNumber: 5,
                                          user: user,
                                          token: state.tokenModel.token
                                              .toString())));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black,
                                      border: Border.all(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              55,
                                          color: Colors.white)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Center(
                                    child: Text(
                                      "PLAY",
                                      style: GoogleFonts.bungee(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ] else ...[
                          Text(
                            "COME BACK TOMMOROW",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                                color: Colors.white),
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
              color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black),
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
                        "Brain Check tokens: ${profile.lifes}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                        child: Image(
                          image: AssetImage("images/brain.png"),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Games played: ${profile.gamesPlayed}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Your current Score: ${profile.points}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Number of questions: 5",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Category: Random",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Difficulty: Random",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.white),
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
