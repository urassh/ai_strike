import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../datamodel/Answer.dart';
import 'AnswerState.dart';

abstract class TimerDelegate {
  void onStopTimer(BuildContext context, WidgetRef ref);
}

final answerProvider = StateNotifierProvider<AnswerViewModel, AnswerState>((ref) {
  return AnswerViewModel();
});

class AnswerViewModel extends StateNotifier<AnswerState> {
  AnswerViewModel() : super(AnswerState.createEmpty());
  Timer? _timer;

  void startTimer(TimerDelegate delegate, BuildContext context, WidgetRef ref) {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime(state.time - 1);

      if (state.time == 0) {
        stopTimer();
        delegate.onStopTimer(context, ref);
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void setAnswer(Answer answer) {
    state = AnswerState(answer: answer, time: state.time);
  }

  void setTime(int time) {
    state = AnswerState(answer: state.answer, time: time);
  }

  init() {
    state = AnswerState.createEmpty();
    _timer = null;
  }
}