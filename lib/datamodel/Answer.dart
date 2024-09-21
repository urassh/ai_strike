import 'dart:typed_data';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/datamodel/response/AnswerResponse.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'Description.dart';
part 'generated/Answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    String? id,
    required GameTheme theme,
    required Description description,
    required int score,
    required String name,
    required Uint8List image,
  }) = _Answer;

  factory Answer.createEmpty() {
    return Answer(
      id: const Uuid().v4(),
      theme: GameTheme.createEmpty(),
      description: Description.createEmpty(),
      score: 0,
      name: "guest",
      image: Uint8List(0),
    );
  }

  static AnswerResponse toResponse(Answer answer) {
    return AnswerResponse(
      id: answer.id ?? const Uuid().v4(),
      themeId: answer.theme.id ?? "empty",
      descriptionId: answer.description.id ?? "empty",
      score: answer.score,
      name: answer.name,
    );
  }

  static Answer fromResponse(AnswerResponse response, GameTheme theme, Description description, Uint8List image) {
    return Answer(
      id: response.id,
      theme: theme,
      description: description,
      score: response.score,
      name: response.name,
      image: image,
    );
  }
}