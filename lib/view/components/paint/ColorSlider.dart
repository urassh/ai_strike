import 'package:flutter/material.dart';

import 'ColorHelper.dart';
import 'ColorPalletNotifier.dart';

class ColorSlider extends StatelessWidget {
  const ColorSlider({super.key});

  void _onChanged(BuildContext context, double value) {
    final colorPallete = ColorPallete.of(context);
    colorPallete.changeColor(ColorHelper.hueToColor(value));
  }

  @override
  Widget build(BuildContext context) {
    final colorPallete = ColorPallete.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  for (var i = 0; i <= 360; i++)
                    HSVColor.fromAHSV(1.0, i.toDouble(), 1.0, 1.0).toColor(),
                ],
                stops: [
                  for (var i = 0; i <= 360; i++) (i / 360).toDouble(),
                ],
              ),
            ),
          ),
        ),
        Slider(
          value: ColorHelper.colorToHue(colorPallete.selectedColor),
          onChanged: (value) => _onChanged(context, value),
          min: 0,
          max: 360,
        ),
      ],
    );
  }
}