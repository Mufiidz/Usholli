import 'package:core/core.dart';

part 'calendar_today_response.mapper.dart';

@MappableClass()
class CalendarTodayResponse with CalendarTodayResponseMappable {
  final String method;
  final int adjustment;
  @MappableField(key: 'ce')
  final CalendarTodayDataResponse masehi;
  @MappableField(key: 'hijr')
  final CalendarTodayDataResponse hijriah;

  CalendarTodayResponse({
    this.method = '',
    this.adjustment = 0,
    this.masehi = const CalendarTodayDataResponse(),
    this.hijriah = const CalendarTodayDataResponse(),
  });
}

@MappableClass()
class CalendarTodayDataResponse with CalendarTodayDataResponseMappable {
  final String today;
  final int day;
  final String dayName;
  final int month;
  final String monthName;
  final int year;

  const CalendarTodayDataResponse({
    this.today = '',
    this.day = 0,
    this.dayName = '',
    this.month = 0,
    this.monthName = '',
    this.year = 0,
  });
}
