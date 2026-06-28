import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../core_network.dart';
import '../response/quran_qcf_response.dart';

part 'quran_apiclient.g.dart';

@RestApi()
abstract class QuranApiClient {
  @factoryMethod
  factory QuranApiClient(Dio dio, {String baseUrl}) = _QuranApiClient;

  @GET('/{page}.json')
  Future<BaseApiResponse<QuranQcfResponse>> getSurah(@Path('page') String page);

}
