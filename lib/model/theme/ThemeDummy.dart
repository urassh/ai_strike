import 'package:ai_strike/datamodel/GameTheme.dart';

import 'ThemeInterface.dart';

class ThemeDummy implements Dummy {
  static List<GameTheme> themes = [
    GameTheme.create(title: 'Theme 1', contents: 'Description 1'),
    GameTheme.create(title: 'Theme 2', contents: 'Description 2'),
    GameTheme.create(title: 'Theme 3', contents: 'Description 3'),
    GameTheme.create(title: 'Theme 4', contents: 'Description 4'),
  ];

  @override
  Future<GameTheme> generateTheme() async {
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(
        GameTheme.create(title: 'Dummy Theme', contents: 'Dummy Contents'));
  }

  @override
  void addTheme(GameTheme theme) {
    themes.add(theme);
  }

  @override
  Future<List<GameTheme>> fetchThemes() async {
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(themes);
  }
}
