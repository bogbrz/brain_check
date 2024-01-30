import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/device_size.dart';

import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/features/pages/result_page/result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.category,
    required this.difficulty,
    required this.questionsNumber,
    required this.user,
  });
  final int category;
  final String difficulty;
  final int questionsNumber;
  final User? user;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var choosedQuestion = null;
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
        ..getQuestion(difficulty: widget.difficulty, category: widget.category),
      child: BlocBuilder<QuestionPageCubit, QuestionPageState>(
        builder: (context, state) {
          final answers = state.answers;
          print(widget.user!.email);
          if (state.questions.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          if (widget.questionsNumber == 0 && youLose ||
              widget.questionsNumber != 0 && index == widget.questionsNumber) {
            return ResultsPage(widget: widget, index: index, points: points);
          } else {
            return Scaffold(
              body: SafeArea(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsetsDirectional.all(16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.black)),
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Question number${index + 1}"),
                              Countdown(
                                controller: controller,
                                seconds: 15,
                                build: (BuildContext context, double time) =>
                                    Text(time.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge),
                                interval: Duration(milliseconds: 100),
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
                          SizedBox(
                              height: screenHeight * 0.15,
                              child: Text(HtmlUnescape()
                                  .convert(state.questions[0].question))),
                        ],
                      ),
                    ),
                    Wrap(
                      children: [
                        for (final option in answers) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                              state
                                                  .questions[0].correctAnswer) {
                                            setState(() {
                                              isCorrect = true;
                                              points++;
                                            });
                                          }
                                          if (answers[choosedQuestion] !=
                                              state
                                                  .questions[0].correctAnswer) {
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
                                              state
                                                  .questions[0].correctAnswer) {
                                            setState(() {
                                              isCorrect = true;
                                              points++;
                                            });
                                          }
                                          if (answers[choosedQuestion] !=
                                              state
                                                  .questions[0].correctAnswer) {
                                            setState(() {
                                              isCorrect = false;
                                              youLose = true;
                                            });
                                          }
                                        }

                                        print(points);
                                        print(youLose);
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: ElevatedButton(
                            onPressed: coolDown && safeCheck == false ||
                                    coolDown == false && safeCheck == false ||
                                    choosedQuestion == null && safeCheck
                                ? null
                                : () {
                                    setState(() {
                                      index++;
                                      choosedQuestion = null;
                                      isCorrect = false;
                                      coolDown = true;
                                      noAnswerChoosed = false;
                                      safeCheck = false;
                                    });

                                    index < widget.questionsNumber
                                        ? context
                                            .read<QuestionPageCubit>()
                                            .getQuestion(
                                              difficulty: widget.difficulty,
                                              category: widget.category,
                                            )
                                            .then(
                                                (value) => controller.restart())
                                            .then((value) =>
                                                controllerSafe.restart())
                                        : null;
                                  },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Next",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                safeCheck == false
                                    ? Countdown(
                                        controller: controllerSafe,
                                        seconds: 5,
                                        build: (BuildContext context,
                                                double time) =>
                                            Text(time.toInt().toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                        interval: Duration(milliseconds: 1000),
                                        onFinished: () {
                                          setState(() {
                                            safeCheck = true;
                                          });
                                          print(safeCheck);
                                        },
                                      )
                                    : Icon(Icons.arrow_forward)
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
              ),
            );
          }
        },
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.choosedQuestion,
    required this.isCorrect,
    required this.option,
    required this.answers,
    required this.screenWidth,
    required this.screenHeight,
  });

  final choosedQuestion;
  final bool isCorrect;
  final String option;
  final List<String> answers;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: choosedQuestion == null
                ? Colors.white
                : isCorrect && option == answers[choosedQuestion]
                    ? Colors.green
                    : isCorrect == false && option == answers[choosedQuestion]
                        ? Colors.red
                        : Colors.white,
            border: Border.all(width: 2, color: Colors.black)),
        width: screenWidth * 0.2,
        height: screenHeight * 0.2,
        child: Text(HtmlUnescape().convert(option)));
  }
}
