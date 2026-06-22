import 'dart:core';

import 'package:collection/collection.dart';
import 'package:core/core.dart';

import '../model/prayer_schedule.dart';
import '../model/prayer_time.dart';
import '../repository/prayer_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetNextPrayerUsecase extends BaseUseCase<PrayerTime, String?> {
  final PrayerRepository _prayerRepository;

  GetNextPrayerUsecase(this._prayerRepository);

  @override
  Future<PrayerTime> execute(String? param) async {
    if (param.isNullOrEmpty()) {
      throw ErrorException('City cant be empty');
    }

    final String? cityId = await _prayerRepository.getCityId(param.orEmpty());

    if (cityId.isNullOrEmpty()) {
      throw ErrorException('City not found');
    }

    final PrayerSchedule? todayPrayer = await _prayerRepository.getTodayPrayerTime(
      cityId.orEmpty(),
    );
    final List<PrayerTime>? todayTimes = todayPrayer?.prayerTimes;

    if (todayTimes == null || todayTimes.isEmpty) {
      throw ErrorException('Prayer time not found for today');
    }

    final DateTime now = DateTime.now();

    PrayerTime? nextPrayerTime = todayTimes.firstWhereOrNull((prayerTime) {
      final DateTime? time = prayerTime.time;
      return time != null && time.isAfter(now);
    });

    if (nextPrayerTime == null) {
      final DateTime tomorrow = now.add(const Duration(days: 1));

      final List<PrayerSchedule> tomorrowPrayerTimes = await _prayerRepository.getPrayerTime(
        cityId.orEmpty(),
        tomorrow.toIsoDate,
      );
      final PrayerSchedule? tomorrowPrayer = tomorrowPrayerTimes.firstOrNull;
      final List<PrayerTime>? tomorrowTimes = tomorrowPrayer?.prayerTimes;

      if (tomorrowTimes == null || tomorrowTimes.isEmpty) {
        throw ErrorException('Prayer time not found for tomorrow');
      }

      nextPrayerTime = tomorrowTimes.firstWhereOrNull((prayerTime) {
        final DateTime? time = prayerTime.time;
        return time != null && time.isAfter(now);
      });
      AppLogger.d('NextPrayerTime', '$nextPrayerTime (tomorrow)');
    }

    if (nextPrayerTime == null) {
      throw ErrorException('Next prayer time not found');
    }

    return nextPrayerTime;
  }
}
