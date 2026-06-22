import 'package:core/core.dart';

import '../model/calendar_today.dart';
import '../repository/calendar_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class CalendarTodayUseCase extends BaseUseCase<CalendarToday, NoParam> {
  final CalendarRepository _calendarRepository;

  CalendarTodayUseCase(this._calendarRepository);

  @override
  Future<CalendarToday> execute(NoParam param) => _calendarRepository.getToday();
}
