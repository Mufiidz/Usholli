import 'package:core/core.dart';
import 'package:network/core_network.dart';
import 'package:storage/storage.dart';

import '../model/export_model.dart';

abstract class PrayerRepository {
  Future<String?> getCityId(String city);
  Future<PrayerSchedule?> getTodayPrayerTime(String cityId);
  Future<List<PrayerSchedule>> getPrayerTime(String cityId, String period);
}

@LazySingleton(as: PrayerRepository)
class PrayerRepositoryImpl implements PrayerRepository {
  final PrayerApiClient _prayerApiClient;
  final SharedPrefsRepository _sharedPrefsRepoitory;
  final PrayerTimeDao _prayerTimeDao;

  PrayerRepositoryImpl(this._prayerApiClient, this._sharedPrefsRepoitory, this._prayerTimeDao);

  @override
  Future<String?> getCityId(String city) async {
    try {
      final SholatLocation? localSholatLocation = await _sharedPrefsRepoitory.getValue(
        SharedPrefKeys.sholatLocation,
      );

      AppLogger.d(this, '[Local] SholatLocation: $localSholatLocation');

      if (localSholatLocation != null &&
          localSholatLocation.location.toLowerCase() == city.toLowerCase()) {
        return localSholatLocation.id;
      }

      final List<SholatLocation> response = await _prayerApiClient.findCity(city).awaitData;

      final SholatLocation? targetLocation = response.firstOrNull;

      AppLogger.d(this, '[Remote] SholatLocation: $targetLocation');

      if (targetLocation == null) {
        return null;
      }

      await _sharedPrefsRepoitory.saveValue(
        SharedPrefKeys.sholatLocation,
        targetLocation,
      );

      return targetLocation.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PrayerSchedule>> getPrayerTime(String cityId, String period) async {
    final List<PrayerTimeTableData> localPrayerTimes = await _prayerTimeDao.getPrayerTimes(
      cityId,
      period,
    );

    if (localPrayerTimes.isNotEmpty) {
      final List<PrayerSchedule> prayerTimes = localPrayerTimes.map((e) {
        PrayerSchedule prayerTime = PrayerScheduleMapper.fromJson(e.toJson());
        prayerTime = prayerTime.copyWith(tanggal: e.prayerDate);
        return prayerTime;
      }).toList();
      AppLogger.d(this, '[Local] PrayerTime: ${prayerTimes.firstOrNull}');
      return prayerTimes;
    }

    final PrayerResponse response = await _prayerApiClient.getPrayerTime(cityId, period).awaitData;

    final List<PrayerSchedule> prayerTimes = response.jadwal.mapEntries((key, value) {
      PrayerSchedule prayerSchedule = PrayerScheduleMapper.fromJson(value.toJson());
      prayerSchedule = prayerSchedule.copyWith(tanggal: key);
      return prayerSchedule;
    }).toList();

    final List<PrayerTimeTableCompanion> prayers = prayerTimes
        .map((e) => e.toLocalStorage(cityId))
        .toList();

    await _prayerTimeDao.addPrayerTimes(prayers);

    return prayerTimes;
  }

  @override
  Future<PrayerSchedule?> getTodayPrayerTime(String cityId) async {
    final DateTime now = DateTime.now();
    final PrayerTimeTableData? localPrayerTime = await _prayerTimeDao.getPrayerTime(cityId);

    if (localPrayerTime != null) {
      PrayerSchedule prayerTime = PrayerScheduleMapper.fromJson(localPrayerTime.toJson());
      prayerTime = prayerTime.copyWith(tanggal: localPrayerTime.prayerDate);
      AppLogger.d(this, '[Local]  Today PrayerTime: $prayerTime');
      return prayerTime;
    }

    final PrayerResponse response = await _prayerApiClient.getPrayerTimeToday(cityId).awaitData;

    AppLogger.d(this, 'PrayerResponse: $response');
    final String prayerDate = response.jadwal.keys.firstOrNull ?? now.toIsoDate;
    final JadwalResponse? jadwalResponse = response.jadwal.values.firstOrNull;

    if (jadwalResponse == null) {
      return null;
    }

    PrayerSchedule prayerTime = PrayerScheduleMapper.fromJson(jadwalResponse.toJson());
    prayerTime = prayerTime.copyWith(tanggal: prayerDate);

    final int id = await _prayerTimeDao.addPrayerTime(
      prayerTime.toLocalStorage(cityId),
    );

    AppLogger.d(this, '[Remote] PrayerTime: $prayerTime, localSaved: $id');
    return prayerTime;
  }
}
