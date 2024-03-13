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
  var choosedAnswer = "";
  var isChoosed = false;
  var points = 0;

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
                    user: widget.user,
                    points: points);
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
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer;
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state
                                                    .firstQuestion.correctAnswer
                                                    .toString()) {
                                              points++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .firstQuestion.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 1) ...[
                            for (final answer in state.answersTwo) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer;
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.secondQuestion
                                                    .correctAnswer
                                                    .toString()) {
                                              points++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .secondQuestion.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 2) ...[
                            for (final answer in state.answersThree) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer;
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state
                                                    .thirdQuestion.correctAnswer
                                                    .toString()) {
                                              points++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .thirdQuestion.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 3) ...[
                            for (final answer in state.answersFour) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer;
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state.fourthQuestion
                                                    .correctAnswer
                                                    .toString()) {
                                              points++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fourthQuestion.correctAnswer
                                          .toString(),
                                      answer: HtmlUnescape()
                                          .convert(answer.toString())))
                            ]
                          ] else if (index == 4) ...[
                            for (final answer in state.answersFive) ...[
                              InkWell(
                                  onTap: isChoosed == true
                                      ? null
                                      : () {
                                          setState(() {
                                            choosedAnswer = answer;
                                            isChoosed = true;
                                            if (choosedAnswer ==
                                                state
                                                    .fifthQuestion.correctAnswer
                                                    .toString()) {
                                              points++;
                                            }
                                          });

                                          print(choosedAnswer);
                                        },
                                  child: AnswerWidget(
                                      isChoosed: isChoosed,
                                      choosedAnswer: choosedAnswer,
                                      correctAnswer: state
                                          .fifthQuestion.correctAnswer
                                          .toString(),
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
                              choosedAnswer = "";
                              isChoosed = false;

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
    required this.correctAnswer,
    required this.choosedAnswer,
    required this.isChoosed,
  });
  final String choosedAnswer;

  final String answer;

  final String correctAnswer;
  final bool isChoosed;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: choosedAnswer.isEmpty && isChoosed == false
            ? Colors.white
            : choosedAnswer == correctAnswer &&
                    choosedAnswer == answer &&
                    isChoosed == true
                ? Colors.green
                : choosedAnswer == answer &&
                        choosedAnswer != correctAnswer &&
                        isChoosed == true
                    ? Colors.red
                    : Colors.white,
        margin: EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 5,
        child: Center(child: Text(answer)));
  }
}
