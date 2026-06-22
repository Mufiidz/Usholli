import 'package:dart_mappable/dart_mappable.dart';

part 'prayer_response.mapper.dart';

@MappableClass()
class PrayerResponse with PrayerResponseMappable {
  @MappableField(key: 'kabko')
  final String city;
  @MappableField(key: 'prov')
  final String province;
  final Map<String, JadwalResponse> jadwal;

  const PrayerResponse({this.city = '', this.province = '', this.jadwal = const {}});
}

@MappableClass()
class JadwalResponse with JadwalResponseMappable {
  final String tanggal;
  final String imsak;
  final String subuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;

  const JadwalResponse({
    this.tanggal = '',
    this.imsak = '',
    this.subuh = '',
    this.terbit = '',
    this.dhuha = '',
    this.dzuhur = '',
    this.ashar = '',
    this.maghrib = '',
    this.isya = '',
  });
}
