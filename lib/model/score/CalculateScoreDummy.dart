import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';

import 'CalculateScore.dart';

class CalculateScoreDummy implements CalculateScore {
  @override
  Future<int> calculateScore(GameTheme theme, Description description) async {
    await Future.delayed(const Duration(seconds: 3));

    return Future.value(100);
  }
}