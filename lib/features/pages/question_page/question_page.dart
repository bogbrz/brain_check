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
                appBar: AppBar(),
                body: Center(
                    child: Container(
                  child: Column(
                    children: [Text("Your Score $points")],
                  ),
                )),
              );
            }
          } else if (widget.questionsNumber != 0 &&
              index == widget.questionsNumber) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                  child: Container(
                child: Text("Your Score $points/${index}"),
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
                    margin: EdgeInsetsDirectional.all(4),
                    padding: EdgeInsets.all(4),
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
                          children: [
                            Text("Question number${index + 1}"),
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
                                          });
                                        }
                                        if (option == state.answers[1]) {
                                          setState(() {
                                            choosedQuestion = 1;
                                          });
                                        }
                                        if (option == state.answers[2]) {
                                          setState(() {
                                            choosedQuestion = 2;
                                          });
                                        }
                                        if (option == state.answers[3]) {
                                          setState(() {
                                            choosedQuestion = 3;
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
                                          });
                                        }
                                        if (option == state.answers[1]) {
                                          setState(() {
                                            choosedQuestion = 1;
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: coolDown
                                ? null
                                : () {
                                    setState(() {
                                      index++;
                                      choosedQuestion = null;
                                      isCorrect = false;
                                      coolDown = true;
                                      noAnswerChoosed = false;
                                      _controller.restart();
                                    });

                                    context
                                        .read<QuestionPageCubit>()
                                        .getQuestion(
                                          difficulty: widget.difficulty,
                                          category: widget.category,
                                        );
                                  },
                            child: Text("Next")),
                        Countdown(
                          controller: _controller,
                          seconds: 15,
                          build: (BuildContext context, double time) =>
                              Text(time.toString()),
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
