import 'package:flutter/material.dart';

import 'GradationContainer.dart';

class GradationButton extends StatelessWidget {
  final String text;
  final double height;
  final double radius;
  final VoidCallback onPressed;

  const GradationButton({
    super.key,
    required this.text,
    required this.height,
    required this.onPressed,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GradationContainer(height: height, radius: radius),

          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}