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
  DateTime? _lastFetchTime;
  bool _hasFetched = false;

  Future<void> fetchAnswers(GameTheme theme) async {
    if (_hasFetched) return; // Prevent multiple fetches
    _hasFetched = true; // Set this to true once fetching starts

    final currentTime = DateTime.now();
    if (_lastFetchTime != null && currentTime.difference(_lastFetchTime!).inSeconds < 30) {
      return;
    }

    final answers = await fetchInterface.fetchAnswers(theme);
    state = answers;

    _lastFetchTime = currentTime;
  }
}
