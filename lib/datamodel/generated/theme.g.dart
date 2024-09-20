// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeImpl _$$ThemeImplFromJson(Map<String, dynamic> json) => _$ThemeImpl(
      id: json['id'] as String?,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$ThemeImplToJson(_$ThemeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'contents': instance.contents,
    };
