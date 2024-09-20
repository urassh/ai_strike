import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle get title {
    return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, shadows: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 4),
        blurRadius: 4.0,
        spreadRadius: 1.0,
      ),
    ]);
  }

  static TextStyle get subTitle {
    return const TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get body {
    return const TextStyle(
      fontSize: 14,
    );
  }

  static LinearGradient get gradation {
    return const LinearGradient(
      colors: [
        Color(0xFFA9C9FF),
        Color(0xFFFFBBEC),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
