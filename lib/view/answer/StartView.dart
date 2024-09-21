import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/answer/AnswerViewModel.dart';
import 'package:ai_strike/view/answer/DrawView.dart';
import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:ai_strike/view/components/ThemeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../util/AppStyle.dart';

class StartView extends ConsumerWidget {
  final GameTheme theme;

  const StartView({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    final answerViewModel = ref.read(answerProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newAnswer = state.answer.copyWith(theme: theme);
      answerViewModel.setAnswer(newAnswer);
    });

    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("${state.time}s",
                    style:
                        const TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              ),
              Text(
                'Theme',
                style: AppStyle.title,
              ),
              const SizedBox(height: 8),
              Center(
                child: FractionallySizedBox(
                    widthFactor: 1.0, child: ThemeCard(delegate: theme)),
              ),
              const SizedBox(height: 120),
              Center(
                child: _EnhancedCircleButton(
                  text: "Start",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DrawView()
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EnhancedCircleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _EnhancedCircleButton(
      {required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppStyle.gradation,
      ),
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24),
          elevation: 10,
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
