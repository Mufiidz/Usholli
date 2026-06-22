import 'package:dart_mappable/dart_mappable.dart';

part 'sholat_location.mapper.dart';

@MappableClass()
class SholatLocation with SholatLocationMappable {
  final String id;
  @MappableField(key: 'lokasi')
  final String location;

  const SholatLocation({this.id = '', this.location = ''});
}
