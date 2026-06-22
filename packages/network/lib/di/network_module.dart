import 'dart:io';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/calendar_apiclient.dart';
import '../data/prayer_apiclient.dart';

@module
abstract class NetworkModule {
  Dio get dio {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      contentType: ContentType.json.value,
    );

    final Dio dio = Dio(options);

    if (kReleaseMode) return dio;

    final PrettyDioLogger dioLogger = PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true);

    dio.interceptors.addAll([dioLogger]);

    return dio;
  }

  @lazySingleton
  PrayerApiClient prayerApiClient(Dio dio) => PrayerApiClient(dio, baseUrl: '${Env.sholatBaseUrl}/sholat');

  @lazySingleton
  CalendarApiClient calendarApiClient(Dio dio) => CalendarApiClient(dio, baseUrl: '${Env.sholatBaseUrl}/cal');
}
