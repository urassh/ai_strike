import 'package:flutter/material.dart';

import 'ColorHelper.dart';
import 'ColorPalletNotifier.dart';

class ColorCircle extends StatelessWidget {
  final int index;
  final double width;

  const ColorCircle({
    Key? key,
    required this.index,
    required this.width,
  }) : super(key: key);

  static final Matrix4 _transform = Matrix4.identity()..scale(1.4);

  @override
  Widget build(BuildContext context) {
    final colorPallete = ColorPallete.of(context);
    final selected = colorPallete.selectedIndex == index;

    return GestureDetector(
      onTap: selected ? null : () => colorPallete.select(index),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: 0,
          end: ColorHelper.colorToHue(colorPallete.colors[index]),
        ),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) {
          return Container(
            width: width,
            height: width,
            transformAlignment: Alignment.center,
            transform: selected ? _transform : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorHelper.hueToColor(value),
              border: Border.all(
                color: selected ? Colors.black54 : Colors.white70,
                width: 6,
              ),
            ),
          );
        },
      ),
    );
  }
}