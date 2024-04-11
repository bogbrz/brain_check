import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/round_score_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_score_state.dart';
part 'generated/player_score_cubit.freezed.dart';

class PlayerScoreCubit extends Cubit<PlayerScoreState> {
  PlayerScoreCubit({required this.duelGameRepository})
      : super(PlayerScoreState(
            errorMessage: null,
            playerOneScore: [],
            playerTwoScore: [],
            status: Status.initial));

  final DuelGameRepository duelGameRepository;

  Future<void> getRoundsScore({
    required String roomId,
  }) async {
    emit(PlayerScoreState(
        errorMessage: null,
        playerOneScore: [],
        playerTwoScore: [],
        status: Status.initial));
    duelGameRepository
        .getRoundsScores(
      roomId: roomId,
    )
        .listen((event) {
      final playerOne =
          event.where((element) => element.playerNumber == 1).toList();
      final playerTwo =
          event.where((element) => element.playerNumber == 2).toList();
      try {
        emit(PlayerScoreState(
            errorMessage: null,
            playerOneScore: playerOne,
            playerTwoScore: playerTwo,
            status: Status.success));
      } catch (e) {
        emit(PlayerScoreState(
            errorMessage: null,
            playerOneScore: [],
            playerTwoScore: [],
            status: Status.error));
      }
    });
  }
}
