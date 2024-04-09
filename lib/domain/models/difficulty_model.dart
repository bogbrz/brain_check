import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/difficulty_model.freezed.dart';

@freezed
class DifficultyModel with _$DifficultyModel {
  factory DifficultyModel({
    required String name,
    required Image icon,
    required String nameId,
    required MaterialColor color,
  }) = _DifficultyModel;
}
