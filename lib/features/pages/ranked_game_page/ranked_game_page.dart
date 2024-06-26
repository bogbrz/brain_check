import 'package:brain_check/app/core/enums/enums.dart';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/models/question_page_route_model.dart';
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart';
import 'package:brain_check/features/pages/ranked_game_page/widgets/info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timer_count_down/timer_controller.dart';
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
          ..getRankingForUpdate(email: user!.email.toString(),userId: user!.uid),
        child: Scaffold(
          body: BlocConsumer<RankedGameCubit, RankedGameState>(
            listener: (context, state) {
              DateTime lastLogin = DateTime.parse(
                  state.profile[0].lastLogIn.toDate().toString());
        
              Duration difference = dateTime.difference(lastLogin);
           
        
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
                  DateTime resetDay = lastLogin.add(const Duration(hours: 24));
        
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 0, 27, 48),
                          Color.fromARGB(180, 66, 120, 255),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                 context.pop();
                                },
                                icon: const Icon(Icons.arrow_back_sharp),
                                color: Colors.white,
                                iconSize:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "Time to reset :",
                                      style: GoogleFonts.bungee(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      child: TimerCountdown(
                                        format: CountDownTimerFormat
                                            .hoursMinutesSeconds,
                                        endTime: resetDay,
                                        timeTextStyle: GoogleFonts.bungee(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                        ),
                                        colonsTextStyle: GoogleFonts.bungee(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                        ),
                                        enableDescriptions: false,
                                        onEnd: () {
                                          context
                                              .read<RankedGameCubit>()
                                              .updateLifes(
                                                lastLogin: DateTime.now(),
                                                profileId:
                                                    state.profile[0].id,
                                              );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                          Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.03),
                              child: InfoWidget(
                                profile: state.profile[0],
                              )),
                          if (state.profile[0].lifes != 0) ...[
                            InkWell(
                              onTap: () async {
                                context
                                    .read<RankedGameCubit>()
                                    .setStartTime(playerId: profileModel.id);
        
                                context.pushNamed(
                                  "/questionPage",
                                  extra: QuestionPageRouteModel(
                                      user: user!,
                                      profileModel: profileModel,
                                      categoryId: null,
                                      questionAmount: 5,
                                      difficulty: '',
                                      gameType: GameType.ranked),
                                );
        
                             
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height *
                                        0.005),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(180, 66, 120, 255),
                                        Colors.white,
                                      ],
                                    )),
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
                              format:
                                  CountDownTimerFormat.hoursMinutesSeconds,
                              endTime: resetDay,
                              timeTextStyle: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                              ),
                              colonsTextStyle: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 30,
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
                    ),
                  );
              }
            },
          ),
        ));
  }
}

