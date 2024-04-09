import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required String email,
    required String nickName,
    required int points,
    required int gamesPlayed,
    required String id,
    required int lifes,
    required Timestamp lastLogIn,
  }) = _ProfileModel;
}
