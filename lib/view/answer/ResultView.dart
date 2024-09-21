import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/components/GradationText.dart';
import 'package:flutter/material.dart';

import '../components/AppScaffold.dart';
import '../components/GradationButton.dart';
import '../components/ThemeCard.dart';
import '../util/AppStyle.dart';

class ResultView extends StatelessWidget {
  final int score;
  final GameTheme theme;
  final Description description;

  const ResultView({super.key, required this.score, required this.theme, required this.description});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBackButton: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GradationText(text: "Score: $score", height: 80),

              const SizedBox(height: 32),

              Text(
                'Theme',
                style: AppStyle.title,
              ),

              const SizedBox(height: 8),

              Center(
                child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ThemeCard(delegate: theme)
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
                    child: ThemeCard(delegate: description)
                ),
              ),

              const SizedBox(height: 48),

              Text(
                'name',
                style: AppStyle.title,
              ),

              const SizedBox(height: 64),

              GradationButton(text: "Top", height: 80, onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              }),
            ],
          ),
        ),
      ),
    );
  }
}