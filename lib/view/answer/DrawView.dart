import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:ai_strike/view/components/ThemeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/GradationCard.dart';
import '../components/GradationContainer.dart';
import '../util/AppStyle.dart';

class DrawView extends StatelessWidget {
  final GameTheme theme;

  const DrawView({super.key, required this.theme});

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
              const Center(
                child: Text("90s", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              ),

              Text(
                'Theme',
                style: AppStyle.title,
              ),

              const SizedBox(height: 8),

              Center(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: ThemeCard(theme: theme)
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
}