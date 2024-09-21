import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:ai_strike/view/components/GradationCard.dart';
import 'package:ai_strike/view/components/ThemeCard.dart';
import 'package:ai_strike/view/show/AnswerCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datamodel/GameTheme.dart';
import '../util/AppStyle.dart';

class ShowView extends ConsumerWidget {
  final GameTheme theme;

  const ShowView({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Show",
                    style: AppStyle.title,
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ThemeCard(delegate: theme),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),

            SizedBox(
              height: 400, // Set the height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: 300, // Set a fixed width for each AnswerCard
                      child: AnswerCard(theme: theme),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
