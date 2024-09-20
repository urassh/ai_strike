import 'package:intl/intl.dart';

class DateFormatter {
  String format(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm');
    return formatter.format(dateTime);
  }

  DateTime parse(String dateString) {
    final DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm');
    return formatter.parse(dateString);
  }
}
