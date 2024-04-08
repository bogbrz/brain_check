import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_status_model.freezed.dart';

@freezed
class RoomStatusModel with _$RoomStatusModel {
  factory RoomStatusModel({required bool startGame, required String id}) =
      _RoomStatusModel;
}
