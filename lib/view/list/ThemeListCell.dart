import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:flutter/material.dart';

class ThemeListCell extends StatelessWidget {
  final GameTheme theme;

  const ThemeListCell({super.key, required this.theme});

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

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
      child: ListTile(
        title: Text(
          theme.title,
          style: _titleStyle,
        ),
        subtitle: const Text(
          '2022/12/31 23:59',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        leading: Text(theme.contents),
      ),
    );
  }
}
