import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'explainFromImage.dart';

class ExplainFromImageImpl implements ExplainFromImage {
  late final GenerativeModel model;

  ExplainFromImageImpl() {
    final apiKey = dotenv.env['API_KEY'] ?? '';
    final model = dotenv.env['MULTI_MODEL'] ?? '';

    if (apiKey.isEmpty) {
      throw Exception('API_KEYが.envファイルに見つかりませんでした');
    }

    if (model.isEmpty) {
      throw Exception('MULTI_MODELが.envファイルに見つかりませんでした');
    }

    this.model = GenerativeModel(
      model: model,
      apiKey: apiKey,
    );
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
