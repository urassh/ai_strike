import 'package:uuid/uuid.dart';

final class Theme {
  final String id;
  final DateTime date;
  final String title;
  final String contents;

  Theme({
    required this.title,
    required this.contents,
    String? id,
    DateTime? date,
  })  : id = id ?? const Uuid().v4(),
        date = date ?? DateTime.now();
}