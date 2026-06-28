import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/base/muslim_api_response.dart';
import '../response/calendar_today_response.dart';

part 'calendar_apiclient.g.dart';

@RestApi()
abstract class CalendarApiClient {
  factory CalendarApiClient(Dio dio, {String baseUrl}) = _CalendarApiClient;

  @GET('/today')
  Future<MuslimApiResponse<CalendarTodayResponse>> getCalendarToday();
}
