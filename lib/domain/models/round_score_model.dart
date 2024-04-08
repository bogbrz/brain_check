import 'package:freezed_annotation/freezed_annotation.dart';

part 'round_score_model.freezed.dart';

@freezed
class RoundScoreModel with _$RoundScoreModel {
  factory RoundScoreModel({
    required int answerOne,
    required int answerTwo,
    required int answerThree,
    required int answerFour,
    required int answerFive,
    required int roundNumber,
    required int playerNumber,
    required String id,
  }) = _RoundScoreModel;
}
