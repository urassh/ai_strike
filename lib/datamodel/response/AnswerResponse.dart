import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/AnswerResponse.freezed.dart';
part 'generated/AnswerResponse.g.dart';

@freezed
class AnswerResponse with _$AnswerResponse {
  const factory AnswerResponse({
    required String id,
    required String themeId,
    required String descriptionId,
    required int score,
    required String name,
  }) = _AnswerResponse;

  factory AnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseFromJson(json);
}