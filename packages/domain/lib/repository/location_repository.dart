import 'package:core/core.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../custom_error/location_exception.dart';

abstract class LocationRepository {
  Future<Position> getLocationPosition();
  Future<String> getCityName(Position position);
}

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Position> getLocationPosition() async {
    try {
      final bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!isServiceEnabled) {
        throw LocationException('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationException('Location permissions are denied', permission);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationException(
          'Location permissions are permanently denied, we cannot request permissions.',
          permission,
        );
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getCityName(Position position) async {
    try {
      final Position(:longitude, :latitude) = position;
      AppLogger.d(this, 'latitude: $latitude, longitude: $longitude');
      final List<Placemark> places = await placemarkFromCoordinates(latitude, longitude);
      final Placemark? place = places.firstOrNull;

      if (place == null) {
        throw LocationException('Location not found');
      }

      AppLogger.d(this, 'Place: $place');
      final String? city = place.subAdministrativeArea;

      if (city == null) {
        throw LocationException('City not found');
      }
      return city;
    } catch (e) {
      rethrow;
    }
  }
}
