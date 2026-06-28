import 'package:dio/dio.dart';

import '../custom_error/network_exception.dart';
import '../response/base/base_response.dart';
import '../response/error_response.dart';

extension FutureExt<T extends ApiResponse> on Future<T> {
  Future<T> get awaitResponse async {
    try {
      return await this;
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;
      throw switch (e.type) {
        .connectionTimeout => NetworkException('Connection timeout', statusCode),
        .badResponse => switch (e.response?.data) {
          Map<String, dynamic> data => NetworkException(
            ErrorResponseMapper.fromJson(data).message,
            statusCode,
          ),
          String data => NetworkException(
            data,
            statusCode,
          ),
          _ => NetworkException(
            e.message ?? 'Failed to fetch data',
            statusCode,
          ),
        },
        .connectionError => NetworkException(
          'Connection error',
          statusCode,
        ),
        _ => NetworkException(e.message ?? 'Failed to fetch data', statusCode),
      };
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}

extension FutureNetworkData<T> on Future<ApiDataResponse<T>> {
  Future<T> get awaitData async => (await awaitResponse).getData();
}
