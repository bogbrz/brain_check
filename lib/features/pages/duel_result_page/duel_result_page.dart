import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/features/pages/duel_result_page/cubit/duel_result_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class DuelResultPage extends StatelessWidget {
  const DuelResultPage(
      {required this.roomId,
      super.key,
      required this.players,
      required this.user});
  final String? roomId;
  final List<PlayerModel>? players;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DuelResultCubit>(),
      child: Scaffold(body: BlocBuilder<DuelResultCubit, DuelResultState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                for (final player in players!) {
                  if (player.email.toString() == user!.email.toString())
                    context.read<DuelResultCubit>().resetGameStatus(
                        roomId: roomId!, status: false, playerId: player.id);
                }

                Navigator.of(context).pop();
              },
              child: Text("END OF DUEL"),
            ),
          );
        },
      )),
    );
  }
}
