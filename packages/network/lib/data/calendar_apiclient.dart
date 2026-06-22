import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/calendar_today_response.dart';
import '../response/sholat_base_response.dart';

part 'calendar_apiclient.g.dart';

@RestApi()
abstract class CalendarApiClient {
  factory CalendarApiClient(Dio dio, {String baseUrl}) = _CalendarApiClient;

  @GET('/today')
  Future<SholatBaseResponse<CalendarTodayResponse>> getCalendarToday();
}
