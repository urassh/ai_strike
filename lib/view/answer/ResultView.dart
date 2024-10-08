import 'package:ai_strike/view/components/GradationContainer.dart';
import 'package:ai_strike/view/components/GradationText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/AppScaffold.dart';
import '../components/GradationButton.dart';
import '../components/ThemeCard.dart';
import '../util/AppStyle.dart';
import 'AnswerViewModel.dart';

class ResultView extends ConsumerWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    final answerViewModel = ref.read(answerProvider.notifier);

    Future.delayed(Duration.zero, () {
      answerViewModel.fetchScore();
    });

    return AppScaffold(
        showBackButton: false,
        body: SingleChildScrollView(
          child: state.answer.score <= 0
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GradationText(text: "Score: ${state.answer.score}", height: 80),

                    const SizedBox(height: 32),

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

                    const SizedBox(height: 32),

                    Text(
                      'You',
                      style: AppStyle.title,
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: FractionallySizedBox(
                          widthFactor: 1.0,
                          child: ThemeCard(delegate: state.answer.description)
                      ),
                    ),

                    const SizedBox(height: 48),

                    Text(
                      'name',
                      style: AppStyle.title,
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const GradationContainer(height: 60, radius: 8),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your name',
                            ),
                            autofocus: true,
                            onChanged: (text) {
                              answerViewModel.setName(text);
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 64),

                    GradationButton(text: "Top", height: 80, onPressed: () {
                      answerViewModel.uploadAnswer();
                      answerViewModel.init();
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),

                    const SizedBox(height: 64),
                  ],
                ),
              ),
        ),
    );
  }
}