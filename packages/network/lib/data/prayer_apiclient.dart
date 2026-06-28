import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/base/muslim_api_response.dart';
import '../response/prayer_response.dart';
import '../response/sholat_location.dart';

part 'prayer_apiclient.g.dart';

@RestApi()
abstract class PrayerApiClient {
  @factoryMethod
  factory PrayerApiClient(Dio dio, {String baseUrl}) = _PrayerApiClient;

  @GET('/kabkota/find/{city}')
  Future<MuslimApiResponse<List<SholatLocation>>> findCity(@Path('city') String city);

  @GET('/jadwal/{cityId}/today')
  Future<MuslimApiResponse<PrayerResponse>> getPrayerTimeToday(@Path('cityId') String cityId);

  @GET('/jadwal/{cityId}/{period}')
  Future<MuslimApiResponse<PrayerResponse>> getPrayerTime(
    @Path('cityId') String cityId,
    @Path('period') String period,
  );
}
