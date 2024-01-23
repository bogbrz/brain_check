import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';


@freezed
class ProfileModel with _$ProfileModel {
 
  factory ProfileModel({
    required String email, required String nickName, required int points,
  }) = _ProfileModel;

}