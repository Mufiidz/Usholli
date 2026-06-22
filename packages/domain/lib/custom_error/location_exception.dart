import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';

class LocationException extends BaseException {
  final LocationPermission? permission;
  LocationException(super.message, [this.permission]);

  @override
  String toString() => 'LocationException: $message with permission: $permission';
}
