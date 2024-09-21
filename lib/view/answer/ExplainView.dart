import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/view/components/GradationButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/AppScaffold.dart';
import '../components/GradationContainer.dart';
import '../components/ThemeCard.dart';
import '../util/AppStyle.dart';
import 'AnswerViewModel.dart';
import 'ResultView.dart';

class ExplainView extends ConsumerWidget {
  final Description description;

  ExplainView({required this.description});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    final answerViewModel = ref.read(answerProvider.notifier);

    Future.delayed(Duration.zero, () {
      answerViewModel.fetchDescription();
    });

    return AppScaffold(
      showBackButton: false,
      body: SingleChildScrollView(
        child: state.answer.description.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'You',
                      style: AppStyle.title,
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                        height: 400,
                        child: Image.memory(state.answer.image)
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Describe from Gemini',
                      style: AppStyle.title,
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: FractionallySizedBox(
                          widthFactor: 1.0,
                          child: ThemeCard(delegate: state.answer.description),
                      ),
                    ),


                    const SizedBox(height: 48),

                    GradationButton(text: "Result", height: 80, onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultView()
                        ),
                      );
                    }),

                    const SizedBox(height: 64),
                  ],
                ),
              ),
      ),
    );
  }
}