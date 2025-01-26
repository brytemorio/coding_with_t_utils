import 'package:intl/intl.dart';

class TStatsHelper {
  static String dailyKey(DateTime date) {
    return 'daily_${date.year}_${date.month}_${date.day}';
  }

  static String weeklyKey(DateTime date) {
    final weekNumber = _isoWeekNumber(date);
    return 'weekly_${date.year}_$weekNumber';
  }

  static String monthlyKey(DateTime date) {
    return 'monthly_${date.year}_${date.month}';
  }

  static String yearlyKey(DateTime date) {
    return 'yearly_${date.year}';
  }

  static int _isoWeekNumber(DateTime date) {
    final dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}
