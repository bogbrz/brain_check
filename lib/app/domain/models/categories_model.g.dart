// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      triviaCategories: (json['trivia_categories'] as List<dynamic>)
          .map((e) => TriviaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'trivia_categories': instance.triviaCategories,
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
