// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.incorrectAnswers,
    };
