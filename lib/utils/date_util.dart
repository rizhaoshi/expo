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

  static String secondsToTime(int seconds) {
    if (seconds <= 0 || seconds.isNaN) return "00:00";

    int hours = 0;
    int minutes = 0;
    int remainingSeconds = 0;

    hours = (seconds / 60 / 60).floor();
    minutes = (seconds / 60 % 60).floor();
    remainingSeconds = seconds % 60;

    return '${formatNumber(hours)}:${formatNumber(minutes)}:${formatNumber(remainingSeconds)}';
  }

  static String formatNumber(int count) {
    String countStr = count.toString();
    return countStr.length > 1 ? countStr : "0$countStr";
  }
}
