import 'package:ai_strike/datamodel/Answer.dart';

class AnswerState {
  final Answer answer;
  final int time;
  static const int limitTime = 20;

  AnswerState({required this.answer, required this.time});

  AnswerState copyWith({Answer? answer, int? time}) {
    return AnswerState(
      answer: answer ?? this.answer,
      time: time ?? this.time,
    );
  }

  factory AnswerState.createEmpty() {
    return AnswerState(answer: Answer.createEmpty(), time: AnswerState.limitTime);
  }
}