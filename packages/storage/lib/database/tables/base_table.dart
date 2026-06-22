import 'package:drift/drift.dart';

mixin BaseTable on Table {
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().nullable()();
}
