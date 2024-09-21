import 'package:ai_strike/view/components/paint/ColorPalletNotifier.dart';
import 'package:flutter/material.dart';

import 'CanvasArea.dart';
import 'ColorPath.dart';
import 'ColorSelectionWidget.dart';
import 'UndoButtonBar.dart';

class PaintCanvas extends StatelessWidget {
  final ColorPath colorPath;

  const PaintCanvas(this.colorPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColorPallete(
      notifier: ColorPalleteNotifier(),
      child: Stack(
          children: [
            const CanvasArea(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ColorSelectionWidget(),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: UndoButtonBar(),
            )
          ],
      ),
    );
  }
}