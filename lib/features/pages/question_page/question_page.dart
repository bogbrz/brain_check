import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.category,
    required this.difficulty,
  });
  final int category;
  final String difficulty;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentIndex = 0;
  var qChoosed = 0;
  var pointCounter = 0;
  var choosedAnswer = "";

  List<String> answersList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<QuestionPageCubit>()
          ..getFiveQuestions(
            category: widget.category,
            difficulty: widget.difficulty,
          ),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<QuestionPageCubit, QuestionPageState>(
            builder: (context, state) {
              if (state.questions.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              if (currentIndex == 5) {
                return ResultsWidget(
                  score: pointCounter,
                );
              }

              final currentQuestion = state.questions[currentIndex];
              answersList.addAll(
                currentQuestion.incorrectAnswers,
              );
              answersList.add(currentQuestion.correctAnswer);
              answersList.shuffle();

              print(" CURRENT QUESTION  ${currentQuestion}");

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("${currentIndex + 1}/5"),
                              ],
                            ),
                            Text(
                                HtmlUnescape()
                                    .convert(currentQuestion.question),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        )),
                    Wrap(
                      children: [
                        for (final answer in answersList) ...[
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: Material(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () {
                                  if (answer == answersList[0]) {
                                    qChoosed = 1;
                                    choosedAnswer = answer;
                                  } else if (answer == answersList[1]) {
                                    qChoosed = 2;
                                    choosedAnswer = answer;
                                  } else if (answer == answersList[2]) {
                                    qChoosed = 3;
                                    choosedAnswer = answer;
                                  } else if (answer == answersList[3]) {
                                    qChoosed = 4;
                                    choosedAnswer = answer;
                                  } else {
                                    qChoosed = 5;
                                    choosedAnswer = answer;
                                  }
                                  if (choosedAnswer ==
                                      currentQuestion.correctAnswer) {
                                    pointCounter = pointCounter + 1;
                                  }
                                  print(pointCounter);

                                  print(qChoosed);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 56, 146, 249)),
                                    child: Text(HtmlUnescape().convert(answer),
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex++;
                          answersList.clear();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.10,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("NEXT",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            Icon(
                              Icons.arrow_forward_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({
    super.key,
    required this.score,
  });
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CORRECT ANSWERS: $score/5 "),
                Text("TIME: 2:24 "),
                Text("YOUR SCORE: 2313421 "),
                Text("RANKING POINTS: "),
              ],
            )),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.10,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("RETURN",
                    style: Theme.of(context).textTheme.headlineSmall),
                Icon(
                  Icons.home,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
