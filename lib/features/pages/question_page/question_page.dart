import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart';

import 'package:brain_check/features/pages/duel_result_page/duel_result_page.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/question_page/widgets/option_widget.dart';
import 'package:brain_check/features/pages/result_page/result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.user,
    required this.category,
    required this.difficulty,
    required this.questionsAmount,
    required this.gameType,
    required this.roomId,
  });

  final User? user;

  final int? category;
  final String difficulty;
  final int questionsAmount;
  final GameType gameType;
  final String? roomId;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var index = 0;
  var choosedAnswer = "";
  var isChoosed = false;
  var end = false;

  var answerOne = 0;
  var answerTwo = 0;
  var answerThree = 0;
  var answerFour = 0;
  var answerFive = 0;
  var answerSix = 0;
  var answerSeven = 0;
  var answerEight = 0;
  var answerNine = 0;
  var answerTen = 0;
  var answerEleven = 0;
  var answerTwelve = 0;
  var answerThirteen = 0;
  var answerFourteen = 0;
  var answerFithteen = 0;
  final CountdownController controller = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuestionPageCubit>()
        ..getQuestion(
          roomId: widget.roomId,
          category: widget.category,
          difficulty: widget.difficulty,
          questionsAmount: widget.questionsAmount,
        ),
      child: BlocBuilder<QuestionPageCubit, QuestionPageState>(
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
              if (index == widget.questionsAmount) {
                return DuelResultPage(
                  gameType: widget.gameType,
                  questionAmount: widget.questionsAmount,
                  roomId: null,
                  players: null,
                  user: widget.user,
                  ownerEmail: null,
                  answerOne: answerOne,
                  answerTwo: answerTwo,
                  answerThree: answerThree,
                  answerFour: answerFour,
                  answerFive: answerFive,
                  answerSix: answerSix,
                  answerSeven: answerSeven,
                  answerEight: answerEight,
                  answerNine: answerNine,
                  answerTen: answerTen,
                  answerEleven: answerEleven,
                  answerTwelve: answerTwelve,
                  answerThirteen: answerThirteen,
                  answerFourteen: answerFourteen,
                  answerFithteen: answerFithteen,
                  gameStatus: null,
                );
              }

              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsetsDirectional.all(
                            MediaQuery.of(context).size.height * 0.01),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: MediaQuery.of(context).size.width / 55,
                                color: Colors.black)),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.00125,
                                  left:
                                      MediaQuery.of(context).size.height * 0.01,
                                  right: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${AppLocalizations.of(context).roundNumber} ${index + 1}",
                                      style: GoogleFonts.bungee(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      )),
                                  Countdown(
                                    controller: controller,
                                    seconds: 2,
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
                                          .firstQuestion!.question
                                          .toString())
                                      : index == 1
                                          ? HtmlUnescape().convert(state
                                              .secondQuestion!.question
                                              .toString())
                                          : index == 2
                                              ? HtmlUnescape().convert(state
                                                  .thirdQuestion!.question
                                                  .toString())
                                              : index == 3
                                                  ? HtmlUnescape().convert(state
                                                      .fourthQuestion!.question
                                                      .toString())
                                                  : index == 4
                                                      ? HtmlUnescape().convert(
                                                          state.fifthQuestion!
                                                              .question
                                                              .toString())
                                                      : index == 5
                                                          ? HtmlUnescape()
                                                              .convert(state
                                                                  .sixthQuestion!
                                                                  .question
                                                                  .toString())
                                                          : index == 6
                                                              ? HtmlUnescape()
                                                                  .convert(state.seventhQuestion!.question.toString())
                                                              : index == 7
                                                                  ? HtmlUnescape().convert(state.eightQuestion!.question.toString())
                                                                  : index == 8
                                                                      ? HtmlUnescape().convert(state.ninthQuestion!.question.toString())
                                                                      : index == 9
                                                                          ? HtmlUnescape().convert(state.tenthQuestion!.question.toString())
                                                                          : index == 10
                                                                              ? HtmlUnescape().convert(state.eleventhQuestion!.question.toString())
                                                                              : index == 11
                                                                                  ? HtmlUnescape().convert(state.twelvethQuestion!.question.toString())
                                                                                  : index == 12
                                                                                      ? HtmlUnescape().convert(state.thirteenthQuestion!.question.toString())
                                                                                      : index == 13
                                                                                          ? HtmlUnescape().convert(state.fourteenthQuestion!.question.toString())
                                                                                          : HtmlUnescape().convert(state.fifteenthQuestion!.question.toString()),
                                  style: GoogleFonts.bungee(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 45,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Wrap(
                        children: [
                          if (index == 0) ...[
                            for (final answer in state.answersOne!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.firstQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerOne++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .firstQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 1) ...[
                            for (final answer in state.answersTwo!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.secondQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerTwo++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .secondQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 2) ...[
                            for (final answer in state.answersThree!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.thirdQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerThree++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .thirdQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 3) ...[
                            for (final answer in state.answersFour!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.fourthQuestion!
                                                    .correctAnswer
                                                    .toString()) {}
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fourthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 4) ...[
                            for (final answer in state.answersFive!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.fifthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerFive++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fifthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 5) ...[
                            for (final answer in state.answersSix!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.sixthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerSix++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .sixthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 6) ...[
                            for (final answer in state.answersSeven!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.seventhQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerSeven++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .seventhQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 7) ...[
                            for (final answer in state.answersEight!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.eightQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerEight++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .eightQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 8) ...[
                            for (final answer in state.answersNine!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.ninthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerNine++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .ninthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 9) ...[
                            for (final answer in state.answersNine!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.tenthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerTen++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .tenthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 10) ...[
                            for (final answer in state.answersEleven!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.eleventhQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerEleven++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .eleventhQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 11) ...[
                            for (final answer in state.answersTwelve!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.twelvethQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerTwelve++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .twelvethQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 12) ...[
                            for (final answer in state.answersThirteen!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.thirteenthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerThirteen++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .thirteenthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 13) ...[
                            for (final answer in state.answersFourteen!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.fourteenthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerFourteen++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fourteenthQuestion!.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 14) ...[
                            for (final answer in state.answersFifteen!) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer.toString();
                                            isChoosed = true;
                                            end = true;
                                            if (choosedAnswer ==
                                                state.fifteenthQuestion!
                                                    .correctAnswer
                                                    .toString()) {
                                              answerFithteen++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fifteenthQuestion!.correctAnswer
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
              );
          }
        },
      ),
    );
  }
}
