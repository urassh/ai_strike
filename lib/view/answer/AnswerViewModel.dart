import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/model/explain/explainFromImage.dart';
import 'package:ai_strike/model/explain/explainFromImageDummy.dart';
import 'package:ai_strike/view/util/Uint8ListExt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
  final ExplainFromImage _explainFromImage = ExplainFromImageDummy();
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

  Future<void> fetchDescription() async {
    File imageFile;
    String contents = "";

    try {
      imageFile = await state.answer.image.saveToFile("${state.answer.theme.id}.jpg");
      contents = await _explainFromImage.explainFromImage(imageFile);
    } catch (e) {
      print(e);
    }

    final description = Description(title: "Gemini", contents: contents);
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

  init() {
    state = AnswerState.createEmpty();
    _timer = null;
  }
}