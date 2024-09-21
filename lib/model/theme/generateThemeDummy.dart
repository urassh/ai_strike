import 'package:ai_strike/datamodel/GameTheme.dart';

import 'generateTheme.dart';

class GenerateThemeDummy implements GenerateTheme {
  @override
  Future<GameTheme> generalTheme() {
    return Future.value(GameTheme.create(title: 'Dummy Theme', contents: 'Dummy Contents'));
  }
}