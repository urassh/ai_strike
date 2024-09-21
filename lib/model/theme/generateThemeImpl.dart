// generateThemeImpl.dart
import '../../datamodel/theme.dart';
// import 'generateThemeImpl.dart'; // 自己インポートを削除
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

/// APIキーが見つからない場合のカスタム例外。
class ApiKeyNotFoundException implements Exception {
  final String message;
  ApiKeyNotFoundException(this.message);

  @override
  String toString() => 'ApiKeyNotFoundException: $message';
}

/// GenerateThemeインターフェースの実装クラス。
class GenerateThemeImpl implements GenerateTheme {
  final String themeModel;
  final String visionModel;

  /// コンストラクタでモデル名を指定可能。デフォルトは'gemini-pro'と'gemini-pro-vision'。
  GenerateThemeImpl({
    this.themeModel = 'gemini-pro',
    this.visionModel = 'gemini-pro-vision',
  });

  /// 環境変数からAPIキーを取得します。
  ///
  /// APIキーが存在しない場合は[ApiKeyNotFoundException]をスローします。
  String _getApiKey() {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw ApiKeyNotFoundException('API_KEYが.envファイルに見つかりませんでした');
    }
    return apiKey;
  }

  /// ユニークなお題を生成します。
  ///
  /// [Theme]オブジェクトを返します。
  ///
  /// 例外:
  /// - [ApiKeyNotFoundException]: APIキーが見つからない場合。
  /// - [Exception]: コンテンツ生成に失敗した場合。
  @override
  Future<Theme> generalTheme() async {
    final apiKey = _getApiKey();

    final model = GenerativeModel(
      model: themeModel,
      apiKey: apiKey,
    );

    final content = [
      Content.text('ユニークな絵のお題を提案してください。'),
    ];

    final response = await model.generateContent(contents: content);
    if (response.text == null) {
      throw Exception('コンテンツ生成に失敗しました');
    }

    return Theme(title: response.text!);
  }

  /// 選択された画像の内容を説明します。
  ///
  /// 説明文を返します。
  ///
  /// 例外:
  /// - [ApiKeyNotFoundException]: APIキーが見つからない場合。
  /// - [Exception]: 画像の説明生成に失敗した場合。
  Future<String> describeImage(File imageFile) async {
    final apiKey = _getApiKey();

    final model = GenerativeModel(
      model: visionModel,
      apiKey: apiKey,
    );

    final imageBytes = await imageFile.readAsBytes();
    final imgPart = DataPart('image/jpeg', imageBytes);
    final prompt = TextPart('この画像の内容を詳しく説明してください。');
    final content = [
      Content.multi([prompt, imgPart])
    ];

    final response = await model.generateContent(contents: content);
    if (response.text == null) {
      throw Exception('画像の説明生成に失敗しました');
    }

    return response.text!;
  }
}
