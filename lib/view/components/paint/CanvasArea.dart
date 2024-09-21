import 'package:flutter/material.dart';

import 'ColorPalletNotifier.dart';
import 'ColorPath.dart';
import 'CustomPainter.dart';

class CanvasArea extends StatefulWidget {
  const CanvasArea({super.key});

  @override
  _CanvasAreaState createState() => _CanvasAreaState();
}

class _CanvasAreaState extends State<CanvasArea> {
  late ColorPath _colorPath;

  void _onPanStart(DragStartDetails details) {
    _colorPath.setFirstPoint(details.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _colorPath.updatePath(details.localPosition);
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    ColorPath.paths.add(_colorPath);
    setState(() {
      _colorPath = ColorPath(ColorPallete.of(context).selectedColor);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorPath = ColorPath(ColorPallete.of(context).selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Stack(
        children: [
          for (final colorPath in ColorPath.paths)
            CustomPaint(
              size: Size.infinite,
              painter: PathPainter(colorPath),
            ),
          CustomPaint(
            size: Size.infinite,
            painter: PathPainter(_colorPath),
          ),
        ],
      ),
    );
  }
}