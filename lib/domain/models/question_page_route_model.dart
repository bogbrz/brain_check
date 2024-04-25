

import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/question_page_route_model.freezed.dart';

@freezed
class QuestionPageRouteModel with _$QuestionPageRouteModel {
  factory QuestionPageRouteModel({
      required User user,
      required ProfileModel profileModel,
      required int? categoryId,
      required int questionAmount,
      required String? difficulty,
      required GameType gameType,
      
    

  }) = _QuestionPageRouteModel;
}
