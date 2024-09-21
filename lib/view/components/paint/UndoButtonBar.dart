import 'package:flutter/material.dart';

import 'ColorPalletNotifier.dart';
import 'ColorPath.dart';

class UndoButtonBar extends StatelessWidget {
  const UndoButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        IconButton(
          icon: const Icon(Icons.undo_rounded),
          color: Colors.black38,
          onPressed: () => _undo(context),
        ),
        IconButton(
          icon: const Icon(Icons.delete_rounded),
          color: Colors.black38,
          onPressed: () => _clear(context),
        ),
      ],
    );
  }

  void _clear(BuildContext context) {
    ColorPath.paths.clear();
    ColorPallete.of(context).rebuild();
  }

  void _undo(BuildContext context) {
    ColorPath.paths.removeLast();
    ColorPallete.of(context).rebuild();
  }
}