import 'package:ai_strike/datamodel/Description.dart';
import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/components/GradationButton.dart';
import 'package:flutter/material.dart';

import '../components/AppScaffold.dart';
import '../components/GradationContainer.dart';
import '../components/ThemeCard.dart';
import '../util/AppStyle.dart';
import 'ResultView.dart';

class ExplainView extends StatelessWidget {
  final Description description;

  ExplainView({required this.description});

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
              Text(
                'You',
                style: AppStyle.title,
              ),

              const SizedBox(height: 8),

              const GradationContainer(height: 400),

              const SizedBox(height: 32),

              Text(
                'Describe from Gemini',
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

              GradationButton(text: "Result", height: 80, onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultView(
                          score: 0,
                          theme: GameTheme.create(title: "Gemini", contents: "Twins"),
                          description: description
                      )
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