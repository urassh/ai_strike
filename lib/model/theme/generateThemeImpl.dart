import '../../datamodel/theme.dart';
import 'generateTheme.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class GenerateThemeImpl implements GenerateTheme {
  @override
  Future<Theme> generalTheme() async {
    // .envファイルからAPIキーを取得
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API_KEYが.envファイルに見つかりませんでした');
    }

    // Geminiモデルを初期化
    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );

    // 絵のお題を生成するためのプロンプトを定義します
    final content = [
      Content.text('創造的でユニークな絵のお題を一つ提案してください。'),
    ];

    // Gemini APIを使用してコンテンツを生成します
    final response = await model.generateContent(content);
    final themeText = response.text ?? 'デフォルトのお題';

    // Themeオブジェクトを作成して返します
    return Theme(title: themeText);
  }
}
