import 'package:intl/intl.dart';

class DateUtils {
  static DateTime? fromString(String date) {
    try {
      return DateFormat().parse(date);
    } catch (_) {
      return null;
    }
  }
}
