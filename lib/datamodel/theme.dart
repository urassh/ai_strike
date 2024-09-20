import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/theme.freezed.dart';
part 'generated/theme.g.dart';

@freezed
class Theme with _$Theme {
  const Theme._();

  const factory Theme({
    String? id,
    required DateTime date,
    required String title,
    required String contents,
  }) = _Theme;

  factory Theme.create({
    DateTime? date,
    required String title,
    required String contents,
  }) {
    return Theme(
      id: const Uuid().v4(),
      date: date ?? DateTime.now(),
      title: title,
      contents: contents,
    );
  }

  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);
}