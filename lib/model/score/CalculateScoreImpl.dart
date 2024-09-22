import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'CalculateScore.dart';


class CalculateScoreImpl implements CalculateScore {
  String apiUrl = 'https://comparison-of-text-api-173821842668.us-central1.run.app/similarity';
  @override
  Future<int> calculateScore(GameTheme theme, Description description) async {


    final headers = {
      'Content-Type': 'application/json',
      // 'x-api-key': 'YOUR_API_KEY',
    };

    final body = jsonEncode({
      'sentence_correct': theme.contents,
      'sentence_proposed': description.contents,
    });

    try {
      // HTTP POST リクエストの送信
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      // レスポンスのステータスコードを確認
      if (response.statusCode == 200) {
        // レスポンスボディをJSONとしてデコード
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // 'similarity_score' キーが存在するか確認
        if (jsonResponse.containsKey('similarity_score')) {
          final dynamic score = jsonResponse['similarity_score'];

          // スコアが数値であることを確認
          if (score is num) {
            return (score * 100).toInt();
          } else {
            throw Exception('Invalid similarity_score format.');
          }
        } else {
          throw Exception('similarity_score not found in the response.');
        }
      } else {
        // エラーメッセージを含めて例外をスロー
        throw Exception(
            'Failed to calculate similarity score. Status code: ${response.statusCode}. Body: ${response.body}');
      }
    } catch (e) {
      // ネットワークエラーや他の例外をキャッチ
      throw Exception('Error occurred while calculating similarity score: $e');
    }
  }
}
