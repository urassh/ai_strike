// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../GameTheme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameTheme _$GameThemeFromJson(Map<String, dynamic> json) {
  return _GameTheme.fromJson(json);
}

/// @nodoc
mixin _$GameTheme {
  String? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  /// Serializes this GameTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameThemeCopyWith<GameTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameThemeCopyWith<$Res> {
  factory $GameThemeCopyWith(GameTheme value, $Res Function(GameTheme) then) =
      _$GameThemeCopyWithImpl<$Res, GameTheme>;
  @useResult
  $Res call({String? id, DateTime date, String title, String contents});
}

/// @nodoc
class _$GameThemeCopyWithImpl<$Res, $Val extends GameTheme>
    implements $GameThemeCopyWith<$Res> {
  _$GameThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? title = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameThemeImplCopyWith<$Res>
    implements $GameThemeCopyWith<$Res> {
  factory _$$GameThemeImplCopyWith(
          _$GameThemeImpl value, $Res Function(_$GameThemeImpl) then) =
      __$$GameThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, DateTime date, String title, String contents});
}

/// @nodoc
class __$$GameThemeImplCopyWithImpl<$Res>
    extends _$GameThemeCopyWithImpl<$Res, _$GameThemeImpl>
    implements _$$GameThemeImplCopyWith<$Res> {
  __$$GameThemeImplCopyWithImpl(
      _$GameThemeImpl _value, $Res Function(_$GameThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? title = null,
    Object? contents = null,
  }) {
    return _then(_$GameThemeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameThemeImpl extends _GameTheme {
  const _$GameThemeImpl(
      {this.id,
      required this.date,
      required this.title,
      required this.contents})
      : super._();

  factory _$GameThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameThemeImplFromJson(json);

  @override
  final String? id;
  @override
  final DateTime date;
  @override
  final String title;
  @override
  final String contents;

  @override
  String toString() {
    return 'GameTheme(id: $id, date: $date, title: $title, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameThemeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, title, contents);

  /// Create a copy of GameTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameThemeImplCopyWith<_$GameThemeImpl> get copyWith =>
      __$$GameThemeImplCopyWithImpl<_$GameThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameThemeImplToJson(
      this,
    );
  }
}

abstract class _GameTheme extends GameTheme {
  const factory _GameTheme(
      {final String? id,
      required final DateTime date,
      required final String title,
      required final String contents}) = _$GameThemeImpl;
  const _GameTheme._() : super._();

  factory _GameTheme.fromJson(Map<String, dynamic> json) =
      _$GameThemeImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime get date;
  @override
  String get title;
  @override
  String get contents;

  /// Create a copy of GameTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameThemeImplCopyWith<_$GameThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
