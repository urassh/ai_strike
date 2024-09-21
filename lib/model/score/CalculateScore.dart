import 'package:ai_strike/datamodel/Description.dart';
import '../../datamodel/GameTheme.dart';

abstract class CalculateScore {
  Future<int> calculateScore(GameTheme theme, Description description);
}