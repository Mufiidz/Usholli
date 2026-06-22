import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'daos/prayer_time_dao.dart';
import 'tables/prayer_time_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PrayerTimeTable], daos: [PrayerTimeDao])
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openDbConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openDbConnection() => driftDatabase(
    name: Env.databaseName,
    native: DriftNativeOptions(databaseDirectory: getApplicationSupportDirectory),
  );
}
