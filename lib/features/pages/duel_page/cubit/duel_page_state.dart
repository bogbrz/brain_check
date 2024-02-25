part of 'duel_page_cubit.dart';

@freezed
class DuelPageState with _$DuelPageState {
  const factory DuelPageState({
    required String? errorMessage, required List<GameRoomModel> rooms, required Status status, 
  }) = _Initial;
}
