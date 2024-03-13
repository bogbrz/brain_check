import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/device_size.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_result_page/duel_result_page.dart';

import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/question_page/widgets/option_widget.dart';
import 'package:brain_check/features/pages/result_page/result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(
      {super.key,
      required this.category,
      required this.difficulty,
      required this.questionsNumber,
      required this.user,
      required this.token,
      required this.isRanked,
      required this.isDuel,
      required this.players,
      required this.roomId});
  final String token;
  final int category;
  final String difficulty;
  final int questionsNumber;
  final User? user;
  final bool isRanked;
  final bool isDuel;
  final List<PlayerModel>? players;
  final String? roomId;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  var choosedQuestion;
  var index = 0;
  var isCorrect = false;
  var next = false;
  var points = 0;
  var youLose = false;
  var coolDown = true;
  var noAnswerChoosed = false;
  var safeCheck = false;

  final CountdownController controller = CountdownController(autoStart: true);
  final CountdownController controllerSafe =
      CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.deviceWidth;
    final screenHeight = context.deviceHeight;

    return BlocProvider(
        create: (context) => getIt<QuestionPageCubit>()
          ..getQuestion(
            difficulty: widget.difficulty,
            category: widget.category,
            token: widget.token,
          ),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<QuestionPageCubit, QuestionPageState>(
              builder: (context, state) {
                final answers = state.answers;

                if (widget.questionsNumber == 0 && youLose ||
                    widget.questionsNumber != 0 &&
                        index == widget.questionsNumber &&
                        widget.isDuel == false) {
                  return ResultsPage(
                    isRanked: widget.isRanked,
                    index: index,
                    points: points,
                    isDuel: widget.isDuel,
                    players: widget.players,
                    roomId: widget.roomId,
                    user: widget.user,
                    questionPage: QuestionPage(
                        players: widget.players,
                        roomId: widget.roomId,
                        isRanked: widget.isRanked,
                        token: widget.token,
                        category: widget.category,
                        difficulty: widget.difficulty,
                        questionsNumber: widget.questionsNumber,
                        isDuel: widget.isDuel,
                        user: widget.user),
                  );
                }

                switch (state.status) {
                  case Status.initial:
                    return const InitialStateWidget();
                  case Status.loading:
                    return const LoadingStateWidget();
                  case Status.error:
                    return ErrorStateWidget(
                        errorMessage: state.errorMessage.toString());

                  case Status.success:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsetsDirectional.all(16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: MediaQuery.of(context).size.width / 55,
                                  color: Colors.black)),
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Question number ${index + 1}",
                                    style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                    ),
                                  ),
                                  Countdown(
                                    controller: controller,
                                    seconds: 15,
                                    build:
                                        (BuildContext context, double time) =>
                                            Text(
                                      time.toString(),
                                      style: GoogleFonts.bungee(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35,
                                      ),
                                    ),
                                    interval: const Duration(milliseconds: 100),
                                    onFinished: () {
                                      setState(() {
                                        coolDown = false;
                                      });
                                      if (choosedQuestion == null) {
                                        setState(() {
                                          noAnswerChoosed = true;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                    height: screenHeight * 0.15,
                                    child: Text(
                                      HtmlUnescape()
                                          .convert(state.questions[0].question),
                                      style: GoogleFonts.bungee(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            for (final option in answers) ...[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Material(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: choosedQuestion != null ||
                                            noAnswerChoosed == true
                                        ? null
                                        : () {
                                            if (answers.length == 4) {
                                              if (option == answers[0]) {
                                                setState(() {
                                                  choosedQuestion = 0;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (option == answers[1]) {
                                                setState(() {
                                                  choosedQuestion = 1;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (option == answers[2]) {
                                                setState(() {
                                                  choosedQuestion = 2;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (option == answers[3]) {
                                                setState(() {
                                                  choosedQuestion = 3;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (answers[choosedQuestion] ==
                                                  state.questions[0]
                                                      .correctAnswer) {
                                                setState(() {
                                                  isCorrect = true;
                                                  points++;
                                                });
                                              }
                                              if (answers[choosedQuestion] !=
                                                  state.questions[0]
                                                      .correctAnswer) {
                                                setState(() {
                                                  isCorrect = false;
                                                  youLose = true;
                                                });
                                              }
                                            } else {
                                              if (option == answers[0]) {
                                                setState(() {
                                                  choosedQuestion = 0;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (option == answers[1]) {
                                                setState(() {
                                                  choosedQuestion = 1;
                                                  controller.pause();
                                                  coolDown = false;
                                                });
                                              }
                                              if (answers[choosedQuestion] ==
                                                  state.questions[0]
                                                      .correctAnswer) {
                                                setState(() {
                                                  isCorrect = true;
                                                  points++;
                                                });
                                              }
                                              if (answers[choosedQuestion] !=
                                                  state.questions[0]
                                                      .correctAnswer) {
                                                setState(() {
                                                  isCorrect = false;
                                                  youLose = true;
                                                });
                                              }
                                            }
                                          },
                                    child: OptionWidget(
                                        choosedQuestion: choosedQuestion,
                                        isCorrect: isCorrect,
                                        option: option,
                                        answers: answers,
                                        screenWidth: screenWidth,
                                        screenHeight: screenHeight),
                                  ),
                                ),
                              )
                            ],
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        InkWell(
                            onTap: coolDown && safeCheck == false ||
                                    coolDown == false && safeCheck == false ||
                                    choosedQuestion == null &&
                                        safeCheck == false
                                ? null
                                : () async {
                                    setState(() {
                                      index++;
                                      choosedQuestion = null;
                                      isCorrect = false;
                                      coolDown = true;
                                      noAnswerChoosed = false;
                                      safeCheck = false;
                                    });

                                    index < widget.questionsNumber ||
                                            widget.questionsNumber == 0
                                        ? await context
                                            .read<QuestionPageCubit>()
                                            .getQuestion(
                                              difficulty: widget.difficulty,
                                              category: widget.category,
                                              token: widget.token,
                                            )
                                            .then(
                                                (value) => controller.restart())
                                            .then((value) =>
                                                controllerSafe.restart())
                                        : null;
                                  },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 8),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Next",
                                      style: GoogleFonts.bungee(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                      )),
                                  safeCheck == false
                                      ? Countdown(
                                          controller: controllerSafe,
                                          seconds: 5,
                                          build: (BuildContext context,
                                                  double time) =>
                                              Text(time.toInt().toString(),
                                                  style: GoogleFonts.bungee(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            25,
                                                  )),
                                          interval: const Duration(
                                              milliseconds: 1000),
                                          onFinished: () {
                                            setState(() {
                                              safeCheck = true;
                                            });
                                          },
                                        )
                                      : Text("->",
                                          style: GoogleFonts.bungee(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                25,
                                          )),
                                ],
                              ),
                            )),
                        Text(widget.token)
                      ],
                    );
                }
              },
            ),
          ),
        ));
  }
}
