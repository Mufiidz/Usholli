import 'package:core/core.dart';
import 'package:network/custom_error/network_exception.dart';

import '../model/prayer_schedule.dart';
import '../repository/prayer_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetPrayertimeTodayUsecase extends BaseUseCase<PrayerSchedule, String?> {
  final PrayerRepository _prayerRepository;

  GetPrayertimeTodayUsecase(this._prayerRepository);

  @override
  Future<PrayerSchedule> execute(String? param) async {
    try {
      if (param.isNullOrEmpty()) {
        throw ErrorException('City cant be empty');
      }

      final String? cityId = await _prayerRepository.getCityId(param.orEmpty());

      if (cityId.isNullOrEmpty()) {
        throw ErrorException('City not found');
      }

      final PrayerSchedule? prayerTime = await _prayerRepository.getTodayPrayerTime(
        cityId.orEmpty(),
      );

      if (prayerTime == null) {
        throw ErrorException('Prayer time not found');
      }
      return prayerTime;
    } on NetworkException catch (e) {
      final int? errorCode = e.code;
      if (errorCode == 404) {
        throw ErrorException('Prayer time not found', reason: e);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
