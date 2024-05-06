
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/duel_room_page_route_model.freezed.dart';

@freezed
class DuelRoomRoutePageModel with _$DuelRoomRoutePageModel {
  factory DuelRoomRoutePageModel({
       required User? user,
  required String nickName,
  required String? userPicture,
  required GameRoomModel roomModel,
    

  }) = _DuelRoomRoutePageModel;
}
