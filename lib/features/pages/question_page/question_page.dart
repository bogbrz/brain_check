import 'package:brain_check/app/global%20cubit/cubit/user_page_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/device_size.dart';

import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(
      {super.key,
      required this.category,
      required this.difficulty,
      required this.questionsNumber});
  final int category;
  final String difficulty;
  final int questionsNumber;

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

  final CountdownController _controller = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.deviceWidth;
    final screenHeight = context.deviceHeight;

    return BlocProvider(
      create: (context) => getIt<QuestionPageCubit>()
        ..getQuestion(difficulty: widget.difficulty, category: widget.category),
      child: BlocBuilder<QuestionPageCubit, QuestionPageState>(
        builder: (context, state) {
          if (state.questions.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          if (widget.questionsNumber == 0) {
            if (youLose == true) {
              return Scaffold(
                body: Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Your Score $points",
                          style: Theme.of(context).textTheme.headlineLarge),
                      Material(
                        clipBehavior: Clip.hardEdge,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: BlocBuilder<UserPageCubit, UserPageState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                for (final profile in state.profile) {
                                  context.read<QuestionPageCubit>().updateStats(
                                        points: points,
                                        id: profile.id,
                                      );
                                }

                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 27, 58, 93),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "FINISH",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )),
              );
            }
          } else if (widget.questionsNumber != 0 &&
              index == widget.questionsNumber) {
            return Scaffold(
              body: Center(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Your Score $points/$index",
                        style: Theme.of(context).textTheme.headlineLarge),
                    Material(
                      clipBehavior: Clip.hardEdge,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BlocBuilder<UserPageCubit, UserPageState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              for (final profile in state.profile) {
                                context.read<QuestionPageCubit>().updateStats(
                                      points: points,
                                      id: profile.id,
                                    );
                              }

                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.05,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 27, 58, 93),
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "FINISH",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
            );
          }

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
                              controller: _controller,
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
                      for (final option in state.answers) ...[
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
                                      if (state.answers.length == 4) {
                                        if (option == state.answers[0]) {
                                          setState(() {
                                            choosedQuestion = 0;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (option == state.answers[1]) {
                                          setState(() {
                                            choosedQuestion = 1;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (option == state.answers[2]) {
                                          setState(() {
                                            choosedQuestion = 2;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (option == state.answers[3]) {
                                          setState(() {
                                            choosedQuestion = 3;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (state.answers[choosedQuestion] ==
                                            state.questions[0].correctAnswer) {
                                          setState(() {
                                            isCorrect = true;
                                            points++;
                                          });
                                        }
                                        if (state.answers[choosedQuestion] !=
                                            state.questions[0].correctAnswer) {
                                          setState(() {
                                            isCorrect = false;
                                            youLose = true;
                                          });
                                        }
                                      } else {
                                        if (option == state.answers[0]) {
                                          setState(() {
                                            choosedQuestion = 0;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (option == state.answers[1]) {
                                          setState(() {
                                            choosedQuestion = 1;
                                            _controller.pause();
                                            coolDown = false;
                                          });
                                        }
                                        if (state.answers[choosedQuestion] ==
                                            state.questions[0].correctAnswer) {
                                          setState(() {
                                            isCorrect = true;
                                            points++;
                                          });
                                        }
                                        if (state.answers[choosedQuestion] !=
                                            state.questions[0].correctAnswer) {
                                          setState(() {
                                            isCorrect = false;
                                            youLose = true;
                                          });
                                        }
                                      }

                                      print(points);
                                      print(youLose);
                                    },
                              child: Container(
                                  padding: EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: choosedQuestion == null
                                          ? Colors.white
                                          : isCorrect &&
                                                  option ==
                                                      state.answers[
                                                          choosedQuestion]
                                              ? Colors.green
                                              : isCorrect == false &&
                                                      option ==
                                                          state.answers[
                                                              choosedQuestion]
                                                  ? Colors.red
                                                  : Colors.white,
                                      border: Border.all(
                                          width: 2, color: Colors.black)),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.2,
                                  child: Text(HtmlUnescape().convert(option))),
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                        onPressed: coolDown
                            ? null
                            : () {
                                setState(() {
                                  index++;
                                  choosedQuestion = null;
                                  isCorrect = false;
                                  coolDown = true;
                                  noAnswerChoosed = false;
                                });

                                context
                                    .read<QuestionPageCubit>()
                                    .getQuestion(
                                      difficulty: widget.difficulty,
                                      category: widget.category,
                                    )
                                    .then((value) => _controller.restart());
                              },
                        child: Text("Next")),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
