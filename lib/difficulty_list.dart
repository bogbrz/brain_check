import 'package:brain_check/domain/models/difficulty_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final List<DifficultyModel> difficulties = [
  DifficultyModel(
      name: "Random",
      nameId: "null",
      icon: const Image(image: AssetImage("images/question_mark.png")),
      color: Colors.grey),
  DifficultyModel(
      name: "Easy",
      nameId: "easy",
      icon: const Image(image: AssetImage("images/leave.png")),
      color: Colors.green),
  DifficultyModel(
      name: "Medium",
      nameId: "medium",
      icon: const Image(image: AssetImage("images/bitten_leaf_scaled.png")),
      color: Colors.yellow),
  DifficultyModel(
      name: "Hard",
      nameId: "hard",
      icon: const Image(image: AssetImage("images/fire_leaf.png")),
      color: Colors.red),
];
