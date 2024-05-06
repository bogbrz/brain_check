
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/difficulty_page_route_model.freezed.dart';

@freezed
class DifficultyRouteModel with _$DifficultyRouteModel {
  factory DifficultyRouteModel({
      required User user,
      required ProfileModel profileModel,
      required TriviaCategory category,
      
    

  }) = _DifficultyRouteModel;
}
