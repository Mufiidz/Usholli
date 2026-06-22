import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:storage/storage.dart';

import 'prayer_time.dart';

part 'prayer_schedule.mapper.dart';

@MappableClass()
class PrayerSchedule with PrayerScheduleMappable {
  final String tanggal;
  final String imsak;
  final String subuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;

  const PrayerSchedule({
    this.tanggal = '',
    this.imsak = '',
    this.subuh = '',
    this.terbit = '',
    this.dhuha = '',
    this.dzuhur = '',
    this.ashar = '',
    this.maghrib = '',
    this.isya = '',
  });

  DateTime? get imsakTime => _toDateTime(imsak);
  DateTime? get subuhTime => _toDateTime(subuh);
  DateTime? get terbitTime => _toDateTime(terbit);
  DateTime? get dhuhaTime => _toDateTime(dhuha);
  DateTime? get dzuhurTime => _toDateTime(dzuhur);
  DateTime? get asharTime => _toDateTime(ashar);
  DateTime? get maghribTime => _toDateTime(maghrib);
  DateTime? get isyaTime => _toDateTime(isya);

  DateTime? _toDateTime(String time) {
    try {
      if (tanggal.isEmpty || time.isEmpty) return null;
      return DateFormat('yyyy-MM-dd HH:mm', 'id_ID').parse('$tanggal $time');
    } catch (e) {
      AppLogger.e(sender: this, reason: e, message: 'error parse prayer time');
      return null;
    }
  }

  List<PrayerTime> get prayerTimes => [
    PrayerTime(title: 'Subuh', time: subuhTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Dzuhur', time: dzuhurTime, icon: Icons.wb_sunny_rounded),
    PrayerTime(title: 'Ashar', time: asharTime, icon: Icons.wb_sunny_rounded),
    PrayerTime(title: 'Maghrib', time: maghribTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Isya', time: isyaTime, icon: Icons.dark_mode_rounded),
  ];

  List<PrayerTime> get allPrayerTimes => [
    PrayerTime(title: 'Imsak', time: imsakTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Subuh', time: subuhTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Terbit', time: terbitTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Dhuha', time: dhuhaTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Dzuhur', time: dzuhurTime, icon: Icons.wb_sunny_rounded),
    PrayerTime(title: 'Ashar', time: asharTime, icon: Icons.wb_sunny_rounded),
    PrayerTime(title: 'Maghrib', time: maghribTime, icon: Icons.wb_twilight_rounded),
    PrayerTime(title: 'Isya', time: isyaTime, icon: Icons.dark_mode_rounded),
  ];

  PrayerTimeTableCompanion toLocalStorage(String cityId) => PrayerTimeTableCompanion.insert(
    cityId: cityId,
    prayerDate: tanggal,
    imsak: imsak,
    subuh: subuh,
    terbit: terbit,
    dhuha: dhuha,
    dzuhur: dzuhur,
    ashar: ashar,
    maghrib: maghrib,
    isya: isya,
  );
}
