import '../../datamodel/GameTheme.dart';

abstract class GenerateTheme {
  Future<GameTheme> generateTheme();
}

abstract class FetchThemes {
  Future<List<GameTheme>> fetchThemes();
}

abstract class AddTheme {
  void addTheme(GameTheme theme);
}

abstract class Dummy implements GenerateTheme, FetchThemes, AddTheme {
}