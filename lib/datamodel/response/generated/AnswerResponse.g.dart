// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../AnswerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerResponseImpl _$$AnswerResponseImplFromJson(Map<String, dynamic> json) =>
    _$AnswerResponseImpl(
      id: json['id'] as String,
      themeId: json['themeId'] as String,
      descriptionId: json['descriptionId'] as String,
      score: (json['score'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AnswerResponseImplToJson(
        _$AnswerResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'themeId': instance.themeId,
      'descriptionId': instance.descriptionId,
      'score': instance.score,
      'name': instance.name,
    };
