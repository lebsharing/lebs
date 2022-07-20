import 'package:lebs/common/le_application.dart';

class DateTimeUtils {
  /*
   * 月份名称中英文
   */
  static const _monthNameEn = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  static const _monthNameZh = [
    '一月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '十一月',
    '十二月'
  ];
  /*
   * 月份名称英文全称
   */
  static const _monthFullNameEn = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  /*
   * 月份全称
   */
  static String monthFullName(int month) {
    return LeApplication.isZh()
        ? _monthNameZh[month - 1]
        : _monthFullNameEn[month - 1];
  }

  static String monthDayWeekClassTime(DateTime? startTime, DateTime? endTime) {
    if (startTime == null || endTime == null) {
      return "--";
    }
    String month = monthFullName(startTime.month);
    return "$month ${startTime.day}  (${startTime.weekday}) ${startTime.hour}:${startTime.minute}-${endTime.hour}:${endTime.minute}";
  }

  static DateTime monthFirstDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  static DateTime monthLastDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month,
        daysPerMonth(dateTime.year, dateTime.month));
  }

  static String historyDate(DateTime s, DateTime e) {
    String tips = "近三个月";

    if (e.month - s.month <= 0) {
      return "${s.year} ${s.month}";
    }
    return tips;
  }

  /*
   * 每个月的天数
   */
  static int daysPerMonth(int year, int month) => (month == 2)
      ? (year % 4 == 0 ? 29 : 28)
      : ((month == 1 ||
              month == 3 ||
              month == 5 ||
              month == 7 ||
              month == 8 ||
              month == 10 ||
              month == 12)
          ? 31
          : 30);
}
