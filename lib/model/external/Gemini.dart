import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../datamodel/GameTheme.dart';
import '../explain/explainFromImage.dart';
import '../theme/ThemeInterface.dart';

final class Gemini implements GenerateTheme, ExplainFromImage {
  late final GenerativeModel model;

  Gemini() {
    final apiKey = dotenv.env['API_KEY'] ?? '';
    final model = dotenv.env['MODEL'] ?? '';

    if (apiKey.isEmpty) {
      throw Exception('API_KEYが.envファイルに見つかりませんでした');
    }

    if (model.isEmpty) {
      throw Exception('MODELが.envファイルに見つかりませんでした');
    }

    this.model = GenerativeModel(
      model: model,
      apiKey: apiKey,
    );
  }

  @override
  Future<GameTheme> generateTheme() async {
    final content = [
      Content.text('ユニークな絵のお題を提案してください。'),
    ];

    final response = await model.generateContent(content);

    if (response.text == null) {
      throw Exception('コンテンツ生成に失敗しました');
    }

    return GameTheme.create(title: response.text ?? 'デフォルトのお題', contents: '');
  }

  @override
  Future<String> explainFromImage(File imageFile) async {
    final imagePart = await imageFile.readAsPart();
    final prompt = TextPart('この画像の内容を詳しく説明してください。');

    final content = [
      Content.multi([prompt, imagePart])
    ];

    final response = await model.generateContent(content);

    if (response.text == null) {
      throw Exception('画像の説明生成に失敗しました');
    }

    return response.text ?? '説明なし';
  }
}

extension FileExtension on File {
  Future<DataPart> readAsPart() async {
    final imageBytes = await readAsBytes();
    return DataPart('image/jpeg', imageBytes);
  }
}