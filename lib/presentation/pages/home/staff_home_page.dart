import 'package:flutter/material.dart';
import 'package:jobdi/core/env/env.dart';
import 'package:jobdi/core/utils/location_util.dart' show LocationUtil;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'
    show CameraOptions, CircleAnnotation, CircleAnnotationManager, CircleAnnotationOptions, MapWidget, MapboxMap, MapboxOptions, Point, Position;

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  MapboxMap? mapboxMap;
  CircleAnnotationManager? _circleAnnotationManager;
  CircleAnnotation? _userCircle;
  double? _currentLatitude;
  double? _currentLongitude;
  @override
  void initState() {
    MapboxOptions.setAccessToken(Env.mapboxToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: LocationUtil.getPositionStream(),
        builder: (context, asyncSnapshot) {
          final pos = asyncSnapshot.data;
          if (pos != null) {
            _currentLatitude = pos.latitude;
            _currentLongitude = pos.longitude;

            if (mapboxMap != null && _circleAnnotationManager != null) {
              _updateUserAnnotationFromCoords(_currentLatitude!, _currentLongitude!);
            }
          }

          return Stack(
            children: [
              MapWidget(
                onMapCreated: (controller) async {
                  mapboxMap = controller;
                  try {
                    _circleAnnotationManager = await mapboxMap!.annotations.createCircleAnnotationManager();
                    if (_currentLatitude != null && _currentLongitude != null) {
                      _updateUserAnnotationFromCoords(_currentLatitude!, _currentLongitude!);

                    }
                  } catch (e) {}
                },
                cameraOptions: CameraOptions(
                  center: Point(coordinates: Position(_currentLongitude!, _currentLatitude!)),
                  zoom: 15,
                ),
              ),

              Positioned(
                right: 16,
                bottom: 16,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    if (_currentLatitude != null && _currentLongitude != null && mapboxMap != null) {
                      await mapboxMap!.setCamera(
                        CameraOptions(
                          center: Point(coordinates: Position(_currentLongitude!, _currentLatitude!)),
                          zoom: 15,
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _updateUserAnnotationFromCoords(double lat, double lon) async {
    if (_circleAnnotationManager == null || mapboxMap == null) return;

    try {
      final options = CircleAnnotationOptions(
        geometry: Point(coordinates: Position(lon, lat)),
        circleColor: 0xFF2B8AF7, // blue-ish color similar to Google blue dot
        circleRadius: 8,
        circleOpacity: 0.95,
      );

      // recreate the circle annotation to update geometry
      if (_userCircle != null) {
        try {
          await _circleAnnotationManager!.delete(_userCircle!);
        } catch (_) {}
        _userCircle = null;
      }

      _userCircle = await _circleAnnotationManager!.create(options);
    } catch (e) {}
  }
}
