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
      Content.text(
          "ユニークな絵のお題を1つ提案してください。"
          "例: 『宇宙の中で、猫が宇宙船を操縦している』"
      ),
    ];

    final response = await model.generateContent(content);

    if (response.text == null) {
      throw Exception('コンテンツ生成に失敗しました');
    }

    return GameTheme.create(title: 'Geminiからの挑戦状', contents: response.text ?? "「なるほど、つまり一連の手順をすべて試した結果、期待していた成果が得られず、様々なアプローチを繰り返しても、どうしても目的の通りに処理が進まないという状況が続いていたわけですね。それで、最終的には何をどう調整しても、やっぱり生成自体が完了しなかったという理解でよろしいでしょうか？」");
  }

  @override
  Future<String> explainFromImage(File imageFile) async {
    final multiModel = GenerativeModel(
      model: dotenv.env['MULTI_MODEL'] ?? '',
      apiKey:  dotenv.env['API_KEY'] ?? '',
    );

    final imagePart = await imageFile.readAsPart();
    final prompt = TextPart('この画像の内容を日本語で詳しく説明してください。');

    final content = [
      Content.multi([prompt, imagePart])
    ];

    final response = await multiModel.generateContent(content);

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