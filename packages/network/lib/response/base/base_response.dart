import 'package:core/core.dart';

part 'base_response.mapper.dart';

abstract class ApiResponse {}

abstract class ApiDataResponse<T> implements ApiResponse {
  final T? data;

  ApiDataResponse(this.data);

  bool get hasData => data != null;

  T getData() {
    final value = data;
    if (value == null) {
      throw ErrorException('Empty Data');
    }
    return value;
  }
}

@MappableClass()
class BaseApiResponse<T> extends ApiDataResponse<T> {
  BaseApiResponse(super.data);
}
