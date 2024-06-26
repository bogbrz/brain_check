import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/models/result_page_route_model.dart';
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart';
import 'package:brain_check/features/pages/duel_question_page/widgets/answer_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DuelQuestionPage extends StatefulWidget {
  const DuelQuestionPage({
    super.key,
    required this.roomId,
    required this.players,
    required this.user,
    required this.ownerEmail,
    required this.roundNumber,
  });
  final String roomId;
  final List<PlayerModel> players;
  final User? user;
  final String ownerEmail;
  final int roundNumber;

  @override
  State<DuelQuestionPage> createState() => _DuelQuestionPageState();
}

class _DuelQuestionPageState extends State<DuelQuestionPage> {
  var index = 0;
  var choosedAnswer = "";
  var isChoosed = false;
  var end = false;

  var answerOne = 0;
  var answerTwo = 0;
  var answerThree = 0;
  var answerFour = 0;
  var answerFive = 0;
  final CountdownController controller = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelQuestionPageCubit>()
        ..getQfromFb(roomId: widget.roomId, roundNumber: widget.roundNumber),
      child: BlocBuilder<DuelQuestionPageCubit, DuelQuestionPageState>(
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
      

              return Scaffold(
                body: Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsetsDirectional.all(
                              MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(180, 66, 120, 255),
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.00125,
                                    left: MediaQuery.of(context).size.height *
                                        0.01,
                                    right: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${AppLocalizations.of(context).roundNumber} ${index + 1}",
                                        style: GoogleFonts.bungee(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        )),
                                    Countdown(
                                      controller: controller,
                                      seconds: 5,
                                      build: (BuildContext context,
                                              double time) =>
                                          Text(time.toInt().toString(),
                                              style: GoogleFonts.bungee(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                              )),
                                      interval:
                                          const Duration(milliseconds: 1000),
                                      onFinished: () {
                                        setState(() {
                                          index++;
                                          choosedAnswer = "";
                                          isChoosed = false;
                                          if (index == 5) {
                                            context.pushNamed(
                                              "/resultPage",
                                              extra: ResultPageRouteModel(
                                                gameType: GameType.duel,
                                                questionAmount: 5,
                                                roomId: widget.roomId,
                                                players: widget.players,
                                                user: widget.user,
                                                ownerEmail: widget.ownerEmail,
                                                answerOne: answerOne,
                                                answerTwo: answerTwo,
                                                answerThree: answerThree,
                                                answerFour: answerFour,
                                                answerFive: answerFive,
                                                answerSix: 0,
                                                answerSeven: 0,
                                                answerEight: 0,
                                                answerNine: 0,
                                                answerTen: 0,
                                                answerEleven: 0,
                                                answerTwelve: 0,
                                                answerThirteen: 0,
                                                answerFourteen: 0,
                                                answerFithteen: 0,
                                                gameStatus: end,
                                              ),
                                            );
                                          }
                                        });

                                        controller.restart();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.09,
                                  left:
                                      MediaQuery.of(context).size.width * 0.01,
                                  right:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                child: Text(
                                    index == 0
                                        ? HtmlUnescape().convert(state
                                            .firstQuestion.question
                                            .toString())
                                        : index == 1
                                            ? HtmlUnescape().convert(state
                                                .secondQuestion.question
                                                .toString())
                                            : index == 2
                                                ? HtmlUnescape().convert(state
                                                    .thirdQuestion.question
                                                    .toString())
                                                : index == 3
                                                    ? HtmlUnescape().convert(
                                                        state.fourthQuestion
                                                            .question
                                                            .toString())
                                                    : HtmlUnescape().convert(
                                                        state.fifthQuestion
                                                            .question
                                                            .toString()),
                                    style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            if (index == 0) ...[
                              for (final answer in state.answersOne) ...[
                                InkWell(
                                    onTap: isChoosed == true
                                        ? null
                                        : () {
                                            setState(() {
                                              choosedAnswer = answer.toString();
                                              isChoosed = true;
                                              if (choosedAnswer ==
                                                  state.firstQuestion
                                                      .correctAnswer
                                                      .toString()) {
                                                answerOne++;
                                              }
                                            });

                                 
                                          },
                                    child: AnswerWidget(
                                        isChoosed: isChoosed,
                                        choosedAnswer: choosedAnswer,
                                        correctAnswer: state
                                            .firstQuestion.correctAnswer
                                            .toString(),
                                        answer: HtmlUnescape()
                                            .convert(answer.toString())))
                              ]
                            ] else if (index == 1) ...[
                              for (final answer in state.answersTwo) ...[
                                InkWell(
                                    onTap: isChoosed == true
                                        ? null
                                        : () {
                                            setState(() {
                                              choosedAnswer = answer.toString();
                                              isChoosed = true;
                                              if (choosedAnswer ==
                                                  state.secondQuestion
                                                      .correctAnswer
                                                      .toString()) {
                                                answerTwo++;
                                              }
                                            });

                                   
                                          },
                                    child: AnswerWidget(
                                        isChoosed: isChoosed,
                                        choosedAnswer: choosedAnswer,
                                        correctAnswer: state
                                            .secondQuestion.correctAnswer
                                            .toString(),
                                        answer: HtmlUnescape()
                                            .convert(answer.toString())))
                              ]
                            ] else if (index == 2) ...[
                              for (final answer in state.answersThree) ...[
                                InkWell(
                                    onTap: isChoosed == true
                                        ? null
                                        : () {
                                            setState(() {
                                              choosedAnswer = answer.toString();
                                              isChoosed = true;
                                              if (choosedAnswer ==
                                                  state.thirdQuestion
                                                      .correctAnswer
                                                      .toString()) {
                                                answerThree++;
                                              }
                                            });

                                
                                          },
                                    child: AnswerWidget(
                                        isChoosed: isChoosed,
                                        choosedAnswer: choosedAnswer,
                                        correctAnswer: state
                                            .thirdQuestion.correctAnswer
                                            .toString(),
                                        answer: HtmlUnescape()
                                            .convert(answer.toString())))
                              ]
                            ] else if (index == 3) ...[
                              for (final answer in state.answersFour) ...[
                                InkWell(
                                    onTap: isChoosed == true
                                        ? null
                                        : () {
                                            setState(() {
                                              choosedAnswer = answer.toString();
                                              isChoosed = true;
                                              if (choosedAnswer ==
                                                  state.fourthQuestion
                                                      .correctAnswer
                                                      .toString()) {}
                                            });

                                
                                          },
                                    child: AnswerWidget(
                                        isChoosed: isChoosed,
                                        choosedAnswer: choosedAnswer,
                                        correctAnswer: state
                                            .fourthQuestion.correctAnswer
                                            .toString(),
                                        answer: HtmlUnescape()
                                            .convert(answer.toString())))
                              ]
                            ] else if (index == 4) ...[
                              for (final answer in state.answersFive) ...[
                                InkWell(
                                    onTap: isChoosed == true
                                        ? null
                                        : () {
                                            setState(() {
                                              choosedAnswer = answer.toString();
                                              isChoosed = true;
                                              end = true;
                                              if (choosedAnswer ==
                                                  state.fifthQuestion
                                                      .correctAnswer
                                                      .toString()) {
                                                answerFive++;
                                              }
                                            });

                                  
                                          },
                                    child: AnswerWidget(
                                        isChoosed: isChoosed,
                                        choosedAnswer: choosedAnswer,
                                        correctAnswer: state
                                            .fifthQuestion.correctAnswer
                                            .toString(),
                                        answer: HtmlUnescape()
                                            .convert(answer.toString())))
                              ]
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
