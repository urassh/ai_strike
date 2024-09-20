import 'package:flutter/cupertino.dart';

import '../../datamodel/GameTheme.dart';
import '../util/AppStyle.dart';
import 'GradationCard.dart';

class ThemeCard extends StatelessWidget {
  final GameTheme theme;

  const ThemeCard({super.key, required this.theme});

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
              theme.title,
              style: AppStyle.title,
            ),
            const SizedBox(height: 4),
            Text(
              theme.contents,
              style: AppStyle.body,
            ),
          ],
        ),
      ),
    );
  }
}