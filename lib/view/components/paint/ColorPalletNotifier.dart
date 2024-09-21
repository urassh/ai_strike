import 'package:flutter/material.dart';

class ColorPalleteNotifier extends ChangeNotifier {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.amber,
    Colors.brown,
    Colors.grey,
    Colors.black
  ];

  int selectedIndex = 0;

  Color get selectedColor => colors[selectedIndex];

  void changeColor(Color newColor) {
    colors[selectedIndex] = newColor;
    notifyListeners();
  }

  void select(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }
}

class ColorPallete extends InheritedNotifier<ColorPalleteNotifier> {
  const ColorPallete({
    Key? key,
    required ColorPalleteNotifier notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static ColorPalleteNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ColorPallete>()!
        .notifier!;
  }
}