import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_result_state.dart';
part 'duel_result_cubit.freezed.dart';

class DuelResultCubit extends Cubit<DuelResultState> {
  DuelResultCubit({required this.duelGameRepository})
      : super(DuelResultState());
  final DuelGameRepository duelGameRepository;
  Future<void> resetGameStatus({
    required String roomId,
    required bool status,
    required String playerId,
    required int points,
  }) async {
    return duelGameRepository.resetGameStatus(
      roomId: roomId,
      status: status,
      playerId: playerId,
      points: points,
    );
  }

  Future<void> addRoundResults(
      {required String roomId,
      required String playerId,
      required int roundNumber,
      required int answerOne,
      required int answerTwo,
      required int answerThree,
      required int answerFour,
      required int answerFive}) async {}
}
