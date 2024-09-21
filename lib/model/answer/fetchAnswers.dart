import 'package:ai_strike/datamodel/GameTheme.dart';

import '../../datamodel/Answer.dart';

abstract class FetchAnswers {
  Future<List<Answer>> fetchAnswers(GameTheme theme);
}