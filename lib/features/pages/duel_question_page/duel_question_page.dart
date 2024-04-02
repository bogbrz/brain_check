import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart';
import 'package:brain_check/features/pages/duel_question_page/widgets/answer_widget.dart';
import 'package:brain_check/features/pages/duel_result_page/duel_result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DuelQuestionPage extends StatefulWidget {
  const DuelQuestionPage({
    super.key,
    required this.roomId,
    required this.players,
    required this.user,
    required this.ownerEmail,
    required this.roundNumber,
    required this.isCausal,
    this.category,
    this.difficulty,
    this.questionsAmount,
  });
  final String roomId;
  final List<PlayerModel> players;
  final User? user;
  final String ownerEmail;
  final int roundNumber;
  final bool isCausal;
  final int? category;
  final String? difficulty;
  final int? questionsAmount;

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
  var answerSix = 0;
  var answerSeven = 0;
  var answerEight = 0;
  var answerNine = 0;
  var answerTen = 0;
  var answerEleven = 0;
  var answerTwelve = 0;
  var answerThirteen = 0;
  var answerFourteem = 0;
  var answerFithteen = 0;
  final CountdownController controller = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelQuestionPageCubit>()
        ..getQfromFb(
            roomId: widget.roomId,
            roundNumber: widget.roundNumber,
            isCausal: widget.isCausal,
            difficulty: widget.difficulty,
            category: widget.category,
            questionsAmount: widget.questionsAmount),
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
              if (index == widget.questionsAmount) {
                return DuelResultPage(
                  roomId: widget.roomId,
                  players: widget.players,
                  user: widget.user,
                  ownerEmail: widget.ownerEmail,
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
                  answerFourteem: answerFourteem,
                  answerFithteen: answerFithteen,
                  gameStatus: end,
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
                                top: MediaQuery.of(context).size.height * 0.09,
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01,
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
                                                  : HtmlUnescape().convert(state
                                                      .fifthQuestion!.question
                                                      .toString()),
                                  style: GoogleFonts.bungee(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 45,
                                  )),
                            ),
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
                                                    .toString()) {
                                              answerFour++;
                                            }
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
                            for (final answer in state.answersTen!) ...[
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
                                              answerFourteem++;
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
                                              answerThirteen++;
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
