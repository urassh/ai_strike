// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../GameTheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameThemeImpl _$$GameThemeImplFromJson(Map<String, dynamic> json) =>
    _$GameThemeImpl(
      id: json['id'] as String?,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$GameThemeImplToJson(_$GameThemeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'contents': instance.contents,
    };
