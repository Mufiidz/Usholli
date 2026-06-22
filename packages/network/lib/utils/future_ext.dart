import 'package:dio/dio.dart';

import '../custom_error/network_exception.dart';
import '../response/base_response.dart';
import '../response/error_response.dart';

extension FutureExt<T> on Future<BaseApiResponse<T>> {
  Future<T> get awaitResponse async {
    try {
      final BaseApiResponse<T> baseResponse = await this;
      final T? data = baseResponse.data;

      if (data == null) {
        throw NetworkException('Data is null');
      }

      return data;
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
