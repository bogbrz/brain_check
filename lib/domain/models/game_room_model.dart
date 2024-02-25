import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_room_model.freezed.dart';
@freezed
class GameRoomModel with _$GameRoomModel {
  factory GameRoomModel(
      {required String name,
      required String ownerMail,
      required String password,
      required String id}) = _GameRoomModel;
}
