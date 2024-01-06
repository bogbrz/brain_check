import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart';
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
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocBuilder<QuestionPageCubit, QuestionPageState>(
            builder: (context, state) {
              final questionModels = state.questions;
          
          
              print(questionModels);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (final questionModel in questionModels) ...[
                      Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.4,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Text(
                              HtmlUnescape().convert(questionModel.question),
                              style:
                                  Theme.of(context).textTheme.headlineMedium)),
                      Wrap(
                        children: [
                          for (final answer
                              in questionModel.incorrectAnswers) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 56, 146, 249),
                                  ),
                                  child: Text(HtmlUnescape().convert(answer),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)),
                            )
                          ],
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.10,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text("NEXT",
                              style:
                                  Theme.of(context).textTheme.headlineSmall)),
                    ],
                  ],
                ),
              );
            },
          ),
        ));
  }
}
