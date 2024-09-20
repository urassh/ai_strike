import 'package:flutter/material.dart';

class GradationCard extends StatelessWidget {
  final Widget child;

  const GradationCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA9C9FF),
            Color(0xFFFFBBEC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.white.withAlpha(100),
          width: 4.0,
        ),
      ),
      child: child,
    );
  }

}
