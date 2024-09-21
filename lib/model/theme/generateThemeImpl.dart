import '../../datamodel/GameTheme.dart';
import 'generateTheme.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class GenerateThemeImpl implements GenerateTheme {
  late final GenerativeModel model;

  GenerateThemeImpl() {
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
  Future<GameTheme> generalTheme() async {
    final content = [
      Content.text('ユニークな絵のお題を提案してください。'),
    ];

    final response = await model.generateContent(content);

    if (response.text == null) {
      throw Exception('コンテンツ生成に失敗しました');
    }

    return GameTheme.create(title: response.text ?? 'デフォルトのお題', contents: '');
  }
}
