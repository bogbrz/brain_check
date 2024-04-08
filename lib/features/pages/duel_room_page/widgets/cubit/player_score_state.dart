part of 'player_score_cubit.dart';

@freezed
class PlayerScoreState with _$PlayerScoreState {
  const factory PlayerScoreState(
      {required String? errorMessage,
      required List<RoundScoreModel>? playerOneScore,
      required List<RoundScoreModel>? playerTwoScore,
      required Status status}) = _Initial;
}
