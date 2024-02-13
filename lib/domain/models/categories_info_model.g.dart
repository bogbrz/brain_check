// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WelcomeCategoryImpl _$$WelcomeCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$WelcomeCategoryImpl(
      categoryId: json['category_id'] as int?,
      categoryQuestionCount: json['category_question_count'] == null
          ? null
          : CategoryQuestionCount.fromJson(
              json['category_question_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WelcomeCategoryImplToJson(
        _$WelcomeCategoryImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_question_count': instance.categoryQuestionCount,
    };

_$CategoryQuestionCountImpl _$$CategoryQuestionCountImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryQuestionCountImpl(
      totalQuestionCount: json['total_question_count'] as int,
      totalEasyQuestionCount: json['total_easy_question_count'] as int,
      totalMediumQuestionCount: json['total_medium_question_count'] as int,
      totalHardQuestionCount: json['total_hard_question_count'] as int,
    );

Map<String, dynamic> _$$CategoryQuestionCountImplToJson(
        _$CategoryQuestionCountImpl instance) =>
    <String, dynamic>{
      'total_question_count': instance.totalQuestionCount,
      'total_easy_question_count': instance.totalEasyQuestionCount,
      'total_medium_question_count': instance.totalMediumQuestionCount,
      'total_hard_question_count': instance.totalHardQuestionCount,
    };
