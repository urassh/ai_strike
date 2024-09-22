import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'CalculateScore.dart';

String rawData = '{ "key": "value" }';

class CalculateScoreImpl implements CalculateScore {
  String apiUrl = 'https://comparison-of-text-api-173821842668.us-central1.run.app/similarity';
  @override
  Future<int> calculateScore(GameTheme theme, Description description) async {
    final headers = {
      'Content-Type': 'application/json',
      // 'x-api-key': 'YOUR_API_KEY',
    };

    final body = jsonEncode({
      'sentence_correct': theme,
      'sentence_proposed': description,
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final dynamic score = jsonResponse['similarity_score'];

      return score*100.toInt();

    } catch (e) {
      throw Exception('Error occurred while calculating similarity score: $e');
    }
  }
}
