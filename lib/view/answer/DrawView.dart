import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:flutter/cupertino.dart';

class DrawView extends StatelessWidget {
  final GameTheme theme;

  const DrawView({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        showBackButton: false,
        body: Column(
          children: <Widget>[
            Text("DrawView"),
          ],
        )
    );
  }
}