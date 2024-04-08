import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  factory PlayerModel({
    required String email,
    required String nickName,
    required int points,
    required String id,
    required int player,
    required bool ready,
    required bool startGame,
    required int roundNumber,
    required String category,
    
  }) = _PlayerModel;
}
