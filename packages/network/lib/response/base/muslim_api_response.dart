import 'package:core/core.dart';

import '../../core_network.dart';

part 'muslim_api_response.mapper.dart';

@MappableClass()
class MuslimApiResponse<T> extends ApiDataResponse<T> with MuslimApiResponseMappable<T> {
  final bool status;
  final String message;

  MuslimApiResponse(super.data, {this.status = false, this.message = ''});

  factory MuslimApiResponse.fromJson(Map<String, dynamic> json) =>
      MuslimApiResponseMapper.fromJson(json);
}
