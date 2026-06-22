import 'package:core/core.dart';
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/prayer_time_table.dart';

part 'prayer_time_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [PrayerTimeTable])
class PrayerTimeDao extends DatabaseAccessor<AppDatabase> with _$PrayerTimeDaoMixin {
  PrayerTimeDao(super.attachedDatabase);

  Future<List<PrayerTimeTableData>> getPrayerTimes(
    String cityId,
    String period, {
    int? limit,
    int? offset,
  }) => managers.prayerTimeTable
      .filter(
        (table) => table.cityId.equals(cityId) & table.prayerDate.startsWith(period),
      )
      .get(distinct: true, limit: limit, offset: offset);

  Future<PrayerTimeTableData?> getPrayerTime(String cityId, {String? period}) async {
    period ??= DateTime.now().customFormat('yyyy-MM-dd');
    final List<PrayerTimeTableData> prayerTimes = await getPrayerTimes(cityId, period, limit: 1);
    return prayerTimes.firstOrNull;
  }

  Future<int> addPrayerTime(PrayerTimeTableCompanion prayerTime) =>
      managers.prayerTimeTable.create((table) => prayerTime, mode: InsertMode.insertOrReplace);

  Future<void> addPrayerTimes(List<PrayerTimeTableCompanion> prayerTimes) =>
      managers.prayerTimeTable.bulkCreate((table) => prayerTimes, mode: InsertMode.insertOrReplace);
}
