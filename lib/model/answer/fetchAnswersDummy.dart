import 'dart:typed_data';

import 'package:ai_strike/datamodel/Answer.dart';
import 'package:ai_strike/datamodel/Description.dart';
import 'package:flutter/material.dart';

import '../../datamodel/GameTheme.dart';
import 'fetchAnswers.dart';

class FetchAnswersDummy extends FetchAnswers {
  final List<Answer> answers = [
    Answer(
      id: '1',
      theme: GameTheme.createEmpty(),
      description: Description.createEmpty(),
      score: 100,
      name: 'urassh',
      image: Uint8List(0),
    ),
  ];

  @override
  Future<List<Answer>> fetchAnswers() async {
    await Future.delayed(const Duration(seconds: 3));
    return answers;
  }
}