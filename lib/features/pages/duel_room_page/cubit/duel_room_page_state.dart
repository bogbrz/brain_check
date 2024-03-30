part of 'duel_room_page_cubit.dart';

@freezed
class DuelRoomPageState with _$DuelRoomPageState {
  const factory DuelRoomPageState({ required String? errorMessage, required Status status, required List<PlayerModel> playerOne, required List<PlayerModel> playerTwo, required List<PlayerModel> players, required List<RoomStatusModel> roomStatus,required List<TriviaCategory> categories}) = _Initial;
}
