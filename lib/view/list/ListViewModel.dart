import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datamodel/GameTheme.dart';

final themeListProvider =
    StateNotifierProvider<ListViewModel, List<GameTheme>>((ref) {
  return ListViewModel();
});

class ListViewModel extends StateNotifier<List<GameTheme>> {
  ListViewModel() : super([]);

  Future<void> fetchThemes() async {
    await Future.delayed(const Duration(seconds: 2));
    state = [
      GameTheme.create(
          title: 'Theme 1',
          contents:
              'Description Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription'),
      GameTheme.create(title: 'Theme 2', contents: 'Description 2'),
      GameTheme.create(title: 'Theme 3', contents: 'Description 3'),
    ];
  }

  void addTheme(GameTheme theme) {
    state = [...state, theme];
  }
}
