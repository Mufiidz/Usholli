import 'package:dart_mappable/dart_mappable.dart';

import 'base_response.dart';

part 'sholat_base_response.mapper.dart';

@MappableClass()
class SholatBaseResponse<T> with SholatBaseResponseMappable<T> implements BaseApiResponse<T> {
  final bool status;
  @override
  final String message;
  @override
  final T? data;

  SholatBaseResponse({this.status = false, this.message = '', this.data});

  factory SholatBaseResponse.fromJson(Map<String, dynamic> json) => SholatBaseResponseMapper.fromJson(json);
}
