import 'package:core/core.dart';
import 'package:network/core_network.dart';
import 'package:storage/storage.dart';

import '../model/calendar_today.dart';

abstract class CalendarRepository {
  Future<CalendarToday> getToday();
}

@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApiClient _calendarApiClient;
  final SharedPrefsRepository _sharedPrefsRepository;

  CalendarRepositoryImpl(this._calendarApiClient, this._sharedPrefsRepository);

  @override
  Future<CalendarToday> getToday() async {
    final DateTime now = DateTime.now();
    final CalendarToday? localCalendarToday = await _sharedPrefsRepository.getValue(
      SharedPrefKeys.calendarToday,
    );

    AppLogger.d(this, '[Local] CalendarToday: $localCalendarToday');

    if (localCalendarToday != null && localCalendarToday.masehi.isSameDay(now)) {
      return localCalendarToday;
    }

    final CalendarTodayResponse response = await _calendarApiClient
        .getCalendarToday()
        .awaitResponse;

    CalendarTodayData hijriah = CalendarTodayDataMapper.fromJson(
      response.hijriah.toJson(),
    ).copyWith(calendarType: .hijriah);

    AppLogger.d(this, hijriah);

    CalendarTodayData masehi = CalendarTodayDataMapper.fromJson(
      response.masehi.toJson(),
    ).copyWith(calendarType: .masehi);

    AppLogger.d(this, masehi);

    final CalendarToday calendarToday = CalendarToday(hijriah: hijriah, masehi: masehi);

    await _sharedPrefsRepository.saveValue(
      SharedPrefKeys.calendarToday,
      calendarToday,
    );

    return calendarToday;
  }
}
