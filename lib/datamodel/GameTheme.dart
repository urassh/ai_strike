import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'CardDelegate.dart';

part 'generated/GameTheme.freezed.dart';
part 'generated/GameTheme.g.dart';

@freezed
class GameTheme with _$GameTheme implements CardDelegate {
  const GameTheme._();

  const factory GameTheme({
    String? id,
    required DateTime date,
    required String title,
    required String contents,
  }) = _GameTheme;

  factory GameTheme.create({
    DateTime? date,
    required String title,
    required String contents,
  }) {
    return GameTheme(
      id: const Uuid().v4(),
      date: date ?? DateTime.now(),
      title: title,
      contents: contents,
    );
  }

  factory GameTheme.createEmpty() {
    return GameTheme(
      id: const Uuid().v4(),
      date: DateTime.now(),
      title: '',
      contents: '',
    );
  }

  factory GameTheme.fromJson(Map<String, dynamic> json) =>
      _$GameThemeFromJson(json);
}
