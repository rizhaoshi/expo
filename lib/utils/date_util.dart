import 'package:intl/intl.dart';

class DateUtil {
  static const String format = "yyyyMMdd'T'HHmmss'Z'";

  static String formateDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(dateTime);
  }

  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
