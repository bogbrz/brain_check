part of 'rooms_list_page_cubit.dart';

@freezed
class RoomsListPageState with _$RoomsListPageState {
  const factory RoomsListPageState({
    required String? errorMessage,
    required List<GameRoomModel> rooms,
    required Status status,
  }) = _Initial;
}
