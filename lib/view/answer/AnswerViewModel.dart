import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../datamodel/Answer.dart';
import 'AnswerState.dart';

final answerProvider = StateNotifierProvider<AnswerViewModel, AnswerState>((ref) {
  return AnswerViewModel();
});

class AnswerViewModel extends StateNotifier<AnswerState> {
  AnswerViewModel() : super(AnswerState.createEmpty());
  Timer? _timer;
  
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime(state.time - 1);

      if (state.time == 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void onStoppedTimerHandler(void Function() callback) {
    _timer?.cancel();
    callback();
  }

  void setAnswer(Answer answer) {
    state = AnswerState(answer: answer, time: state.time);
  }

  void setTime(int time) {
    state = AnswerState(answer: state.answer, time: time);
  }
}