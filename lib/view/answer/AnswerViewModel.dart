import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/model/answer/addAnswer.dart';
import 'package:ai_strike/model/explain/explainFromImage.dart';
import 'package:ai_strike/model/external/Gemini.dart';
import 'package:ai_strike/model/score/CalculateScore.dart';
import 'package:ai_strike/model/score/CalculateScoreImpl.dart';
import 'package:ai_strike/view/util/Uint8ListExt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../datamodel/Answer.dart';
import '../../model/external/Firebase.dart';
import '../../model/score/CalculateScoreDummy.dart';
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
  final ExplainFromImage _explainFromImage = Gemini();
  final CalculateScore _calculateScore = CalculateScoreImpl();
  final AddAnswer _addAnswer = Firebase();
  final GlobalKey globalKey = GlobalKey();

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

  void setImage(Uint8List image) {
    final newAnswer = state.answer.copyWith(image: image);
    state = state.copyWith(answer: newAnswer);
  }

  void setName(String name) {
    final newAnswer = state.answer.copyWith(name: name);
    state = state.copyWith(answer: newAnswer);
  }

  void uploadAnswer() {
    _addAnswer.addAnswer(state.answer);
  }

  Future<void> fetchDescription() async {
    if (state.answer.description.contents.isNotEmpty) return;

    File imageFile;
    String contents = "";

    try {
      imageFile = await state.answer.image.saveToFile("${state.answer.theme.id}.png");
      contents = await _explainFromImage.explainFromImage(imageFile);
    } catch (e) {
      contents="「なるほど、つまり一連の手順をすべて試した結果、期待していた成果が得られず、様々なアプローチを繰り返しても、どうしても目的の通りに処理が進まないという状況が続いていたわけですね。それで、最終的には何をどう調整しても、やっぱり生成自体が完了しなかったという理解でよろしいでしょうか？」";
    }

    final description = Description.create(title: "Gemini", contents: contents);

    final newAnswer = state.answer.copyWith(description: description);
    state = state.copyWith(answer: newAnswer);
  }

  Future<Uint8List> capturePng() async {
    try {
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      return pngBytes;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> fetchScore() async {
    if (0 < state.answer.score) return;

    final score = await _calculateScore.calculateScore(state.answer.theme, state.answer.description);
    final newAnswer = state.answer.copyWith(score: score);
    state = state.copyWith(answer: newAnswer);
  }

  init() {
    state = AnswerState.createEmpty();
    _timer = null;
  }
}
