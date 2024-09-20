import 'package:flutter/material.dart';

import 'GradationContainer.dart';

class GradationText extends StatelessWidget {
  final String text;
  final double height;
  final double radius;

  const GradationText({
    super.key,
    required this.text,
    required this.height,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          GradationContainer(height: height, radius: radius),

          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
    );
  }
}