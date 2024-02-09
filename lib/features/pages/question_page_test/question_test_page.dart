import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/question_page_test/cubit/question_test_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:html_unescape/html_unescape.dart';

class QuestionTestPage extends HookWidget {
  const QuestionTestPage({
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
  Widget build(BuildContext context) {
    final _questionIndex = useState(0);
    List<String> answers = [];

    final _choosedQuesiton = useState<int?>(null);

    void _incrementIndex() {
      _questionIndex.value++;
    }

    void chooseQuestion({required int questionIndex}) {
      _choosedQuesiton.value = questionIndex;
    }

    return BlocProvider(
        create: (context) => getIt<QuestionTestPageCubit>()
          ..getMockQuestions(
            category: category,
            difficulty: difficulty,
          ),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<QuestionTestPageCubit, QuestionTestPageState>(
              builder: (context, state) {
                print(_choosedQuesiton.value);
                final currentQuesiton = state.questions[_questionIndex.value];
                answers.addAll(currentQuesiton.incorrectAnswers);
                answers.add(currentQuesiton.correctAnswer);

                print(state.questions);
                switch (state.status) {
                  case Status.initial:
                    return InitialStateWidget();
                  case Status.loading:
                    return LoadingStateWidget();
                  case Status.error:
                    print(state.errorMessage);
                    return ErrorStateWidget(
                        errorMessage: state.errorMessage.toString());

                  case Status.success:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width:
                                      MediaQuery.of(context).size.width / 45),
                            ),
                            child: Text(
                              currentQuesiton.question,
                              style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(answers.length, (index) {
                            final option = answers[index];

                            return InkWell(
                              enableFeedback: false,
                              onTap: _choosedQuesiton.value != null
                                  ? null
                                  : () {
                                      chooseQuestion(questionIndex: index);
                                      print(_choosedQuesiton.value);
                                    },
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                45),
                                  ),
                                  child: Text(
                                    HtmlUnescape().convert(option),
                                    style: GoogleFonts.bungee(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            );
                          })..shuffle(),
                        ),
                        InkWell(
                            onTap: () {
                              _incrementIndex();
                              _choosedQuesiton.value = null;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 8),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Next->",
                                  style: GoogleFonts.bungee(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 25,
                                  )),
                            )),
                      ],
                    );
                }
              },
            ),
          ),
        ));
  }
}
