import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/prayer_response.dart';
import '../response/sholat_base_response.dart';
import '../response/sholat_location.dart';

part 'prayer_apiclient.g.dart';

@RestApi()
abstract class PrayerApiClient {
  @factoryMethod
  factory PrayerApiClient(Dio dio, {String baseUrl}) = _PrayerApiClient;

  @GET('/kabkota/find/{city}')
  Future<SholatBaseResponse<List<SholatLocation>>> findCity(@Path('city') String city);

  @GET('/jadwal/{cityId}/today')
  Future<SholatBaseResponse<PrayerResponse>> getPrayerTimeToday(@Path('cityId') String cityId);

  @GET('/jadwal/{cityId}/{period}')
  Future<SholatBaseResponse<PrayerResponse>> getPrayerTime(
    @Path('cityId') String cityId,
    @Path('period') String period,
  );
}
