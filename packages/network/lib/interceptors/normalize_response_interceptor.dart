import 'package:dio/dio.dart';

/// Interceptor yang berfungsi untuk menyelaraskan (*normalize*) seluruh
/// struktur response JSON dari API agar selalu memiliki key `data`.
///
/// **Masalah yang diselesaikan:**
/// Backend seringkali mengembalikan format JSON yang tidak konsisten antar endpoint.
/// Interceptor ini meredam ketidakkonsistenan tersebut dengan mengubah data sebelum
/// masuk ke proses parsing model / mapper.
///
/// **Contoh Transformasi JSON:**
/// * **List Murni:** `[{"id": 1}]` ──> `{"data": [{"id": 1}]}`
/// * **Flat Object:** `{"name": "John"}` ──> `{"data": {"name": "John"}}`
/// * **Null:** `null` ──> `{"data": null}`
/// * **Standar:** `{"data": {...}}` ──> Tidak diubah (tetap apa adanya)
///
/// **Cara Registrasi:**
/// ```dart
/// final dio = Dio();
/// dio.interceptors.add(NormalizeResponseInterceptor());
/// ```
class NormalizeResponseInterceptor extends Interceptor {
  static const String dataKey = 'data';

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final dynamic rawData = response.data;
    response.data = switch (rawData) {
      null => {
        dataKey: null,
      },
      // Map<String, dynamic> json => switch (json) {
      //   _ when !json.containsKey(dataKey) => {
      //     dataKey: json,
      //   },
      //   _ => json,
      // },
      List<dynamic> list => {
        dataKey: list,
      },
      _ => rawData,
    };
    super.onResponse(response, handler);
  }
}
