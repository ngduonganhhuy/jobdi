import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jobdi/core/utils/permission_helper.dart';

class LocationUtil {
  static Future<Position?> getCurrentLocation() async {
    try {
      return Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
    } on PlatformException catch (error) {
      if (error.code == 'location_services_disabled') {
        PermissionHelper.retryLocationPermission();
      }
      return null;
    }
  }

  static Stream<Position> getPositionStream() {
    PermissionHelper.retryLocationPermission();
    final streamLocation = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
    print(streamLocation);
    return streamLocation;
  }
}
