import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/result_page_route_model.freezed.dart';

@freezed
class ResultPageRouteModel with _$ResultPageRouteModel {
  factory ResultPageRouteModel({
    required String? roomId,
  required List<PlayerModel>? players,
  required User? user,

  required String? ownerEmail,
  required int answerOne,
  required int answerTwo,
  required int answerThree,
  required int answerFour,
  required int answerFive,
  required int answerSix,
  required int answerSeven,
  required int answerEight,
  required int answerNine,
  required int answerTen,
  required int answerEleven,
  required int answerTwelve,
  required int answerThirteen,
  required int answerFourteen,
  required int answerFithteen,
  required bool? gameStatus,
  required GameType gameType,

  required int questionAmount,  }) = _ResultPageRouteModel;
}
