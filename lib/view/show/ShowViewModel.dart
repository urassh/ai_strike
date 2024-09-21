import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datamodel/Answer.dart';
import '../../datamodel/GameTheme.dart';
import '../../model/answer/fetchAnswers.dart';
import '../../model/external/Firebase.dart';

final showViewModelProvider = StateNotifierProvider<ShowViewModel, List<Answer>>((ref) {
  return ShowViewModel([]);
});

class ShowViewModel extends StateNotifier<List<Answer>> {
  ShowViewModel(super.state);

  final FetchAnswers fetchInterface = Firebase();

  Future<void> fetchAnswers(GameTheme theme) async {
    final answers = await fetchInterface.fetchAnswers(theme);
    state = answers;
  }
}