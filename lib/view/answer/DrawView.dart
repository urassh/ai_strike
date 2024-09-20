import 'package:flutter/cupertino.dart';

class DrawView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Draw'),
      ),
      child: Center(
        child: Text('Draw'),
      ),
    );
  }
}