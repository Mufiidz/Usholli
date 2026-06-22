import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'prayer_time.mapper.dart';

@MappableClass()
class PrayerTime with PrayerTimeMappable {
  final String title;
  final DateTime? time;
  final IconData? icon;

  const PrayerTime({required this.title, this.time, this.icon});
}
