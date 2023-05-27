import 'package:intl/intl.dart';

enum FormatTo {
  fullTimeUTC('yyyy-MM-ddTHH:mm:ss+00:00'),
  fullTime('yyyy-MM-dd HH:mm:ss'),
  yearMonthDay('yyyy-MM-dd'),
  hourMinuteSecond('HH:mm:ss');

  const FormatTo(this.format);

  final String format;
}

extension DateTimeFormatter on DateTime {
  String formatDateToString({FormatTo? formatTo}) =>
      formatTo == null ? toString() : DateFormat(formatTo.format).format(this);

  DateTime get _now => DateTime.now();
  String get _day => DateFormat(FormatTo.yearMonthDay.format).format(this);

  bool get isToday =>
      _day ==
      DateTime(_now.year, _now.month, _now.day)
          .formatDateToString(formatTo: FormatTo.yearMonthDay);

  bool get isYesterday =>
      _day ==
      DateTime(_now.year, _now.month, _now.day - 1)
          .formatDateToString(formatTo: FormatTo.yearMonthDay);
}
