import 'package:ai_strike/datamodel/Description.dart';
import 'package:flutter/material.dart';

import '../components/AppScaffold.dart';
import '../components/GradationContainer.dart';
import '../components/ThemeCard.dart';
import '../util/AppStyle.dart';

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

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}