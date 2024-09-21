import 'package:flutter/material.dart';
import '../util/AppStyle.dart';

class GradationContainer extends StatelessWidget {
  final double height;
  final double radius;
  final Widget? child;

  const GradationContainer({super.key, required this.height, this.radius = 8, this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: AppStyle.gradation,
      ),

      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}