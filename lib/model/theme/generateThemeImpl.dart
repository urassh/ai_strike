import '../../datamodel/theme.dart';
import 'generateTheme.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

final class GenerateThemeImpl implements GenerateTheme {
  @override
  Future<Theme> generalTheme() async {
    // .envファイルからAPIキーを取得
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API_KEYが.envファイルに見つかりませんでした');
    }

    // Geminiモデルを初期化 (テキスト生成)
    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );

    // 絵のお題を生成するためのプロンプト
    final content = [
      Content.text('ユニークな絵のお題を提案してください。'),
    ];

    // テキスト生成APIの呼び出し
    final response = await model.generateContent(contents: content);
    if (response == null || response.text == null) {
      throw Exception('コンテンツ生成に失敗しました');
    }

    // Themeオブジェクトを作成して返します
    return Theme(title: response.text ?? 'デフォルトのお題');
  }

  // 画像を説明するテキスト生成関数
  Future<String> describeImage(File imageFile) async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API_KEYが.envファイルに見つかりませんでした');
    }

    // Geminiモデルを初期化 (画像とテキストのマルチモーダル入力)
    final model = GenerativeModel(
      model: 'gemini-pro-vision',  // マルチモーダルモデルを使用
      apiKey: apiKey,
    );

    // 画像データを読み込む
    final imageBytes = await imageFile.readAsBytes();
    final imgPart = DataPart('image/jpeg', imageBytes);

    // テキスト部分と画像部分をプロンプトとして渡す
    final prompt = TextPart('この画像の内容を詳しく説明してください。');
    final content = [
      Content.multi([prompt, imgPart])
    ];

    // マルチモーダルAPIの呼び出し
    final response = await model.generateContent(contents: content);
    if (response == null || response.text == null) {
      throw Exception('画像の説明生成に失敗しました');
    }

    return response.text ?? '説明なし';
  }
}
