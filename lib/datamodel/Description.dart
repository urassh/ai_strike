import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/Description.freezed.dart';
part 'generated/Description.g.dart';

@freezed
class Description with _$Description {
  const Description._();

  const factory Description({
    String? id,
    required String title,
    required String contents,
  }) = _Description;

  factory Description.create({
    required String title,
    required String contents,
  }) {
    return Description(
      id: const Uuid().v4(),
      title: title,
      contents: contents,
    );
  }

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}
