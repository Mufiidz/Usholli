import 'package:drift/drift.dart';

import 'base_table.dart';

class PrayerTimeTable extends Table with BaseTable {
  TextColumn get cityId => text()();
  TextColumn get prayerDate => text()();
  TextColumn get imsak => text()();
  TextColumn get subuh => text()();
  TextColumn get terbit => text()();
  TextColumn get dhuha => text()();
  TextColumn get dzuhur => text()();
  TextColumn get ashar => text()();
  TextColumn get maghrib => text()();
  TextColumn get isya => text()();

  @override
  Set<Column<Object>>? get primaryKey => {cityId, prayerDate};
}