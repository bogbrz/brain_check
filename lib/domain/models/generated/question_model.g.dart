// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionsImpl _$$QuestionsImplFromJson(Map<String, dynamic> json) =>
    _$QuestionsImpl(
      responseCode: json['response_code'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionsImplToJson(_$QuestionsImpl instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      type: json['type'] as String?,
      difficulty: json['difficulty'] as String?,
      category: json['category'] as String?,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'difficulty': instance.difficulty,
      'category': instance.category,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.incorrectAnswers,
    };
