import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/question_model.dart';
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

  List<String> answersList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<QuestionPageCubit>()
          ..getFiveQuestions(
              category: widget.category, difficulty: widget.difficulty),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocBuilder<QuestionPageCubit, QuestionPageState>(
            builder: (context, state) {
              if (state.questions.isEmpty) {
                return CircularProgressIndicator();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text("${currentIndex}/5"),
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
                          AnswerWidget(
                            answer: answer,
                            questionModel: currentQuestion,
                          )
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 30,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class AnswerWidget extends StatefulWidget {
  const AnswerWidget(
      {super.key, required this.answer, required this.questionModel});

  final String answer;
  final QuestionModel questionModel;

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  var isChoosed = false;
  var answerName = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () async {
                setState(() {
                  if (isChoosed == true) {
                    isChoosed = false;
                  } else {
                    isChoosed = true;
                    answerName = widget.answer;
                  }
                });
                print(widget.answer);
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: isChoosed &&
                              answerName == widget.questionModel.correctAnswer
                          ? Colors.green
                          : isChoosed &&
                                  answerName !=
                                      widget.questionModel.correctAnswer
                              ? Colors.red
                              : Color.fromARGB(255, 56, 146, 249)),
                  child: Text(HtmlUnescape().convert(widget.answer),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge)),
            ),
          ),
        ),
      ],
    );
  }
}
