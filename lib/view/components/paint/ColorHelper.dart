import 'package:flutter/material.dart';

class ColorHelper {
  static Color hueToColor(double hueValue) =>
      HSVColor.fromAHSV(1.0, hueValue, 1.0, 1.0).toColor();

  static double colorToHue(Color color) => HSVColor.fromColor(color).hue;
}