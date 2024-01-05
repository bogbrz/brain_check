import 'package:brain_check/app/features/pages/question_page/cubit/question_page_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              final model = state.questions;
              print(model);
              if (model == null) {
                return CircularProgressIndicator();
              }
              return Center(
                child: Column(
                  children: [Text(model.question)],
                ),
              );
            },
          ),
        ));
  }
}
