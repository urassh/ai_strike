import 'package:flutter/material.dart';

import 'ColorPath.dart';

class PathPainter extends CustomPainter {
  final ColorPath colorPath;

  PathPainter(this.colorPath);

  Paint get paintBrush {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = colorPath.color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(colorPath.path, paintBrush);
  }

  @override
  bool shouldRepaint(PathPainter old) {
    return true;
  }
}