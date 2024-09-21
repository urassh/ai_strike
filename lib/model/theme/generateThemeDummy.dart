import 'package:ai_strike/datamodel/GameTheme.dart';

import 'generateTheme.dart';

class GenerateThemeDummy implements GenerateTheme {
  @override
  Future<GameTheme> generalTheme() async {
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(
        GameTheme.create(title: 'Dummy Theme', contents: 'Dummy Contents'));
  }
}
