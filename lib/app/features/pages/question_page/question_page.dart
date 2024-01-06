import 'package:brain_check/app/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    super.key,
    required this.category,
    required this.difficulty,
  });
  final int category;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<QuestionPageCubit>()
          ..getQuestion(category: category, difficulty: difficulty),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<QuestionPageCubit, QuestionPageState>(
            builder: (context, state) {
              final questionModels = state.questions;
              print(questionModels);
              if (questionModels == null) {
                return CircularProgressIndicator();
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final questionModel in questionModels) ...[
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                              child: Text(HtmlUnescape()
                                  .convert(questionModel.question))),
                          Wrap(
                            children: [
                              for (final answer
                                  in questionModel.incorrectAnswers) ...[
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Text(HtmlUnescape().convert(answer)))
                              ],
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Text(HtmlUnescape()
                                      .convert(questionModel.correctAnswer)))
                            ],
                          )
                        ],
                      )
                    ],
                  ],
                ),
              );
            },
          ),
        ));
  }
}
