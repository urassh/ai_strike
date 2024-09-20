import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/util/DateFormatter.dart';
import 'package:flutter/material.dart';

abstract class ThemeListCellDelegate {
  void onLeftSwipe();
  void onRightSwipe();
}

class ThemeListCell extends StatelessWidget {
  final GameTheme theme;
  final ThemeListCellDelegate delegate;

  ThemeListCell({
    super.key,
    required this.theme,
    required this.delegate
  });

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

  final formatDate = DateFormatter();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(theme.id!),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          delegate.onRightSwipe();
        } else if (direction == DismissDirection.endToStart) {
          delegate.onLeftSwipe();
        }
        // アイテムを消さないために、常にfalseを返す
        return false;
      },
      child: Container(
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
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 5.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            theme.title,
            style: _titleStyle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                formatDate.format(theme.date),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                theme.contents,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}