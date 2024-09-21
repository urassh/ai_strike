import 'package:ai_strike/datamodel/CardDelegate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/Description.freezed.dart';
part 'generated/Description.g.dart';

@freezed
class Description with _$Description implements CardDelegate {
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

  factory Description.createEmpty() {
    return Description(
      id: const Uuid().v4(),
      title: '',
      contents: '',
    );
  }

  bool get isEmpty => title.isEmpty && contents.isEmpty;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}
