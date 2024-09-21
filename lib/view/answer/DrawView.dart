import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:ai_strike/view/components/ThemeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/GradationContainer.dart';
import '../util/AppStyle.dart';
import 'AnswerViewModel.dart';
import 'ExplainView.dart';

class DrawView extends ConsumerWidget implements TimerDelegate {

  const DrawView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    final answerViewModel = ref.read(answerProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      answerViewModel.startTimer(this, context, ref);
    });

    return AppScaffold(
      showBackButton: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("${state.time}s", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              ),

              Text(
                'Theme',
                style: AppStyle.title,
              ),

              const SizedBox(height: 8),

              Center(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: ThemeCard(delegate: state.answer.theme)
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Draw it',
                style: AppStyle.title,
              ),

              const GradationContainer(height: 400),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onStopTimer(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ExplainView(description: state.answer.description)
      ),
    );
  }
}