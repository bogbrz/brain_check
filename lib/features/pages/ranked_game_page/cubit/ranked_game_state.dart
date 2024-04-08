part of 'ranked_game_cubit.dart';

@freezed
class RankedGameState with _$RankedGameState {
  const factory RankedGameState({
    required String? errorMessage,
    required List<ProfileModel> profile,
    required Status status,
  }) = _Initial;
}
