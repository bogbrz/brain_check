// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WelcomeImpl _$$WelcomeImplFromJson(Map<String, dynamic> json) =>
    _$WelcomeImpl(
      triviaCategories: (json['triviaCategories'] as List<dynamic>)
          .map((e) => TriviaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WelcomeImplToJson(_$WelcomeImpl instance) =>
    <String, dynamic>{
      'triviaCategories': instance.triviaCategories,
    };

_$TriviaCategoryImpl _$$TriviaCategoryImplFromJson(Map<String, dynamic> json) =>
    _$TriviaCategoryImpl(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TriviaCategoryImplToJson(
        _$TriviaCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
