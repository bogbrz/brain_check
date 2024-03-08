import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
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
              if (state.questions.isEmpty) {
                return CircularProgressIndicator();
              } else if (index > state.questions.length.toInt()) {
                return DuelResultPage(
                    roomId: widget.roomId,
                    players: widget.players,
                    user: widget.user);
              }
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Text(state.questions[index].question),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          },
                          child: Text("q"))
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
