import 'package:intl/intl.dart';

class DateFormatter {
  static String formatMonthYearFromTimestamp(int timestamp) {
    final formatter = DateFormat('dd/MM');
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return formatter.format(dateTime);
  }
}