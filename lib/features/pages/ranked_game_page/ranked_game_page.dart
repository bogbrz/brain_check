import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RankedGamePage extends StatelessWidget {
  const RankedGamePage({
    required this.user,
    super.key,
  });

  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RankedGameCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: BlocBuilder<RankedGameCubit, RankedGameState>(
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
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Time to reset tokens: 23:59",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 45,
                        color: Colors.white),
                  ),
                  backgroundColor: const Color.fromARGB(255, 27, 58, 93),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width:
                                        MediaQuery.of(context).size.width / 55,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.38,
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Brain Check tokens: ${state.profile[0].lifes}",
                                              style: GoogleFonts.bungee(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  25,
                                              child: Expanded(
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/brain.png"),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Games played: ${state.profile[0].gamesPlayed}",
                                              style: GoogleFonts.bungee(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Your current Score: ${state.profile[0].points}",
                                              style: GoogleFonts.bungee(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
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
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Category: Random",
                                              style: GoogleFonts.bungee(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Difficulty: Random",
                                              style: GoogleFonts.bungee(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          40,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          )),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                            border: Border.all(
                                width: MediaQuery.of(context).size.width / 55,
                                color: Colors.white)),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          children: [
                            Text(
                              "START",
                              style: GoogleFonts.bungee(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Colors.white),
                            ),
                            Expanded(
                                child: Image(
                                    image: AssetImage(
                                        "images/brain_question_white.png"))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
