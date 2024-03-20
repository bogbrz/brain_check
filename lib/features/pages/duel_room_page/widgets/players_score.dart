import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/round_score_model.dart';
import 'package:brain_check/features/pages/duel_room_page/widgets/cubit/player_score_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayersScore extends StatelessWidget {
  const PlayersScore({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PlayerScoreCubit>()
        ..getRoundsScore(
          roomId: roomId,
        ),
      child: BlocBuilder<PlayerScoreCubit, PlayerScoreState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayerOneScore(
                playerOne: state.playerOneScore ?? [],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (state.playerOneScore == null &&
                      state.playerTwoScore == null) ...[
                    SizedBox.shrink()
                  ] else if (state.playerOneScore != null) ...[
                    for (final score in state.playerOneScore!) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          "${score.roundNumber}",
                          style: GoogleFonts.bungee(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                      )
                    ]
                  ] else ...[
                    for (final score in state.playerTwoScore!) ...[
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          "${score.roundNumber}",
                          style: GoogleFonts.bungee(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                      )
                    ]
                  ],
                ],
              ),
              PlayerTwoScore(
                playerTwo: state.playerTwoScore ?? [],
              ),
            ],
          );
        },
      ),
    );
  }
}

class PlayerTwoScore extends StatelessWidget {
  const PlayerTwoScore({
    super.key,
    required this.playerTwo,
  });
  final List<RoundScoreModel> playerTwo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          for (final score in playerTwo)
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  score.answerOne == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerTwo == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerThree == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerFour == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerFive == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class PlayerOneScore extends StatelessWidget {
  const PlayerOneScore({
    super.key,
    required this.playerOne,
  });
  final List<RoundScoreModel> playerOne;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          for (final score in playerOne)
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  score.answerOne == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerTwo == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerThree == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerFour == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                  score.answerFive == 1
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel_rounded, color: Colors.red),
                ],
              ),
            )
        ],
      ),
    );
  }
}
