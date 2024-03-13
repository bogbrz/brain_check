import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart';
import 'package:brain_check/features/pages/duel_result_page/duel_result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';

class DuelQuestionPage extends StatefulWidget {
  const DuelQuestionPage({
    super.key,
    required this.roomId,
    required this.players,
    required this.user,
  });
  final String roomId;
  final List<PlayerModel> players;
  final User? user;

  @override
  State<DuelQuestionPage> createState() => _DuelQuestionPageState();
}

class _DuelQuestionPageState extends State<DuelQuestionPage> {
  @override
  var index = 0;
  var choosedQuestion = null;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DuelQuestionPageCubit>()..getQfromFb(roomId: widget.roomId),
      child: BlocBuilder<DuelQuestionPageCubit, DuelQuestionPageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const InitialStateWidget();
            case Status.loading:
              return const LoadingStateWidget();
            case Status.error:
              return ErrorStateWidget(
                  errorMessage: state.errorMessage.toString());
            case Status.success:
              if (index == 4) {
                return DuelResultPage(
                    roomId: widget.roomId,
                    players: widget.players,
                    user: widget.user);
              }

              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Text(index == 0
                          ? HtmlUnescape()
                              .convert(state.firstQuestion.question.toString())
                          : index == 1
                              ? HtmlUnescape().convert(
                                  state.secondQuestion.question.toString())
                              : index == 2
                                  ? HtmlUnescape().convert(
                                      state.thirdQuestion.question.toString())
                                  : index == 3
                                      ? HtmlUnescape().convert(state
                                          .fourthQuestion.question
                                          .toString())
                                      : HtmlUnescape().convert(state
                                          .fifthQuestion.question
                                          .toString())),
                      Wrap(
                        children: [
                          if (index == 0) ...[
                            for (final answer in state.answersOne) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (answer == state.answersOne[0]) {
                                        choosedQuestion = 0;
                                      } else if (answer ==
                                          state.answersOne[1]) {
                                        choosedQuestion = 1;
                                      } else if (answer ==
                                          state.answersOne[2]) {
                                        choosedQuestion = 2;
                                      } else if (answer ==
                                          state.answersOne[3]) {
                                        choosedQuestion = 3;
                                      }
                                    });
                                    print(choosedQuestion);
                                  },
                                  child: AnswerWidget(
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 1) ...[
                            for (final answer in state.answersTwo) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (answer == state.answersTwo[0]) {
                                        choosedQuestion = 0;
                                      } else if (answer ==
                                          state.answersTwo[1]) {
                                        choosedQuestion = 1;
                                      } else if (answer ==
                                          state.answersTwo[2]) {
                                        choosedQuestion = 2;
                                      } else if (answer ==
                                          state.answersTwo[3]) {
                                        choosedQuestion = 3;
                                      }
                                    });
                                    print(choosedQuestion);
                                  },
                                  child: AnswerWidget(
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 2) ...[
                            for (final answer in state.answersThree) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (answer == state.answersThree[0]) {
                                        choosedQuestion = 0;
                                      } else if (answer ==
                                          state.answersThree[1]) {
                                        choosedQuestion = 1;
                                      } else if (answer ==
                                          state.answersThree[2]) {
                                        choosedQuestion = 2;
                                      } else if (answer ==
                                          state.answersThree[3]) {
                                        choosedQuestion = 3;
                                      }
                                    });
                                    print(choosedQuestion);
                                  },
                                  child: AnswerWidget(
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 3) ...[
                            for (final answer in state.answersFour) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (answer == state.answersFour[0]) {
                                        choosedQuestion = 0;
                                      } else if (answer ==
                                          state.answersFour[1]) {
                                        choosedQuestion = 1;
                                      } else if (answer ==
                                          state.answersFour[2]) {
                                        choosedQuestion = 2;
                                      } else if (answer ==
                                          state.answersFour[3]) {
                                        choosedQuestion = 3;
                                      }
                                    });
                                    print(choosedQuestion);
                                  },
                                  child: AnswerWidget(
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 4) ...[
                            for (final answer in state.answersFive) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (answer == state.answersFive[0]) {
                                        choosedQuestion = 0;
                                      } else if (answer ==
                                          state.answersFive[1]) {
                                        choosedQuestion = 1;
                                      } else if (answer ==
                                          state.answersFive[2]) {
                                        choosedQuestion = 2;
                                      } else if (answer ==
                                          state.answersFive[3]) {
                                        choosedQuestion = 3;
                                      }
                                    });
                                    print(choosedQuestion);
                                  },
                                  child: AnswerWidget(
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ]
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index++;

                              print(state.secondQuestion);
                              print(state.thirdQuestion);
                              print(state.fourthQuestion);
                            });
                          },
                          child: Text("NEXT"))
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 5,
        child: Center(child: Text(answer)));
  }
}
