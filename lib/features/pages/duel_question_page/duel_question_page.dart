import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart';
import 'package:brain_check/features/pages/duel_result_page/duel_result_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          ? state.firstQuestion.question.toString()
                          : index == 1
                              ? state.secondQuestion.question.toString()
                              : index == 2
                                  ? state.thirdQuestion.question.toString()
                                  : index == 3
                                      ? state.fourthQuestion.question.toString()
                                      : state.fifthQuestion.question
                                          .toString()),
                      Wrap(
                        children: [
                          if (index == 0) ...[
                            for (final answer
                                in state.firstQuestion.answers) ...[
                              InkWell(
                                  onTap: () {},
                                  child:
                                      AnswerWidget(answer: answer.toString()))
                            ]
                          ] else if (index == 1) ...[
                            for (final answer
                                in state.secondQuestion.answers) ...[
                              InkWell(
                                  onTap: () {},
                                  child:
                                      AnswerWidget(answer: answer.toString()))
                            ]
                          ] else if (index == 2) ...[
                            for (final answer
                                in state.thirdQuestion.answers) ...[
                              InkWell(
                                  onTap: () {},
                                  child:
                                      AnswerWidget(answer: answer.toString()))
                            ]
                          ] else if (index == 3) ...[
                            for (final answer
                                in state.fourthQuestion.answers) ...[
                              InkWell(
                                  onTap: () {},
                                  child:
                                      AnswerWidget(answer: answer.toString()))
                            ]
                          ] else if (index == 1) ...[
                            for (final answer
                                in state.fifthQuestion.answers) ...[
                              InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child:
                                      AnswerWidget(answer: answer.toString()))
                            ]
                          ]
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index++;
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
