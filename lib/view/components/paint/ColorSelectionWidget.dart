import 'package:flutter/material.dart';

import 'ColorCircle.dart';
import 'ColorPalletNotifier.dart';
import 'ColorSlider.dart';

class ColorSelectionWidget extends StatelessWidget {
  static const double _circleWidth = 45;

  @override
  Widget build(BuildContext context) {
    final colorPallete = ColorPallete.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < colorPallete.colors.length; i++)
              ColorCircle(
                index: i,
                width: _circleWidth,
              ),
          ],
        ),
        const SizedBox(height: _circleWidth / 6),
        const ColorSlider(),
      ],
    );
  }
}