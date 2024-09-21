import 'package:ai_strike/model/external/Gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datamodel/GameTheme.dart';
import '../../model/theme/ThemeDummy.dart';
import '../../model/theme/ThemeInterface.dart';

final themeListProvider =
    StateNotifierProvider<ListViewModel, List<GameTheme>>((ref) {
  return ListViewModel();
});

class ListViewModel extends StateNotifier<List<GameTheme>> {
  ListViewModel() : super([]);

  final FetchThemes themeInterface = ThemeDummy();
  final AddTheme addThemeInterface = ThemeDummy();
  final GenerateTheme generateThemeInterface = Gemini();

  Future<void> fetchThemes() async {
    final themes = await themeInterface.fetchThemes();
    state = themes;
  }

  Future<void> addTheme() async {
    final generatedTheme = await generateThemeInterface.generateTheme();

    addThemeInterface.addTheme(generatedTheme);
    state = [...state, generatedTheme];
  }
}
