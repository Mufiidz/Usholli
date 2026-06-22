import 'package:core/core.dart';

part 'calendar_today.mapper.dart';

@MappableClass()
class CalendarToday with CalendarTodayMappable {
  final CalendarTodayData masehi;
  final CalendarTodayData hijriah;

  CalendarToday({
    this.masehi = const CalendarTodayData(calendarType: .masehi),
    this.hijriah = const CalendarTodayData(calendarType: .hijriah),
  });
}

@MappableClass()
class CalendarTodayData with CalendarTodayDataMappable {
  final String today;
  final String dayName;
  final String monthName;
  final int day;
  final int month;
  final int year;
  final CalendarType? calendarType;

  const CalendarTodayData({
    this.today = '',
    this.dayName = '',
    this.monthName = '',
    this.day = 0,
    this.month = 0,
    this.year = 0,
    this.calendarType,
  });

  bool isSameDay(DateTime other) {
    if (calendarType == .hijriah) return false;
    return day == other.day && month == other.month && year == other.year;
  }
}

@MappableEnum()
enum CalendarType {
  masehi('M'),
  hijriah('H');

  final String suffix;

  const CalendarType(this.suffix);

  @override
  String toString() => suffix;
}
