import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:ai_strike/view/components/GradationCard.dart';
import 'package:ai_strike/view/util/DateFormatter.dart';
import 'package:flutter/material.dart';

abstract class ThemeListCellDelegate {
  void onLeftSwipe(BuildContext context, GameTheme theme);
  void onRightSwipe(BuildContext context, GameTheme theme);
}

class ThemeListCell extends StatefulWidget {
  final GameTheme theme;
  final ThemeListCellDelegate delegate;

  const ThemeListCell({
    super.key,
    required this.theme,
    required this.delegate,
  });

  @override
  _ThemeListCellState createState() => _ThemeListCellState();
}

class _ThemeListCellState extends State<ThemeListCell> {
  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

  final formatDate = DateFormatter();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.theme.id!),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          widget.delegate.onRightSwipe(context, widget.theme);
        } else if (direction == DismissDirection.endToStart) {
          widget.delegate.onLeftSwipe(context, widget.theme);
        }
        return false;
      },
      child: GradationCard(
        child: ListTile(
          title: Text(
            widget.theme.title,
            style: _titleStyle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                formatDate.format(widget.theme.date),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.theme.contents,
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