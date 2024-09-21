import 'package:ai_strike/datamodel/CardDelegate.dart';
import 'package:flutter/cupertino.dart';

import '../util/AppStyle.dart';
import 'GradationCard.dart';

class ThemeCard extends StatelessWidget {
  final CardDelegate delegate;

  const ThemeCard({super.key, required this.delegate});

  @override
  Widget build(BuildContext context) {
    return GradationCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              delegate.title,
              style: AppStyle.title,
            ),
            const SizedBox(height: 4),
            Text(
              delegate.contents,
              style: AppStyle.body,
            ),
          ],
        ),
      ),
    );
  }
}
