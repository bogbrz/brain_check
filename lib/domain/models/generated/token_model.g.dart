// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      response: json['response'] as int?,
      responeMessage: json['respone_message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'respone_message': instance.responeMessage,
      'token': instance.token,
    };
