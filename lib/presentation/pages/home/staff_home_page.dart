import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:jobdi/core/env/env.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/utils/location_util.dart' show LocationUtil;
import 'package:jobdi/widgets/three_bounce_loading.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  mapbox.MapboxMap? mapboxMap;
  mapbox.CircleAnnotationManager? _circleAnnotationManager;
  mapbox.CircleAnnotation? _userCircle;
  double? _currentLatitude;
  double? _currentLongitude;
  late final Future<bool> _locationFuture;

  @override
  void initState() {
    super.initState();
    mapbox.MapboxOptions.setAccessToken(Env.mapboxToken);
    _locationFuture = _initializeLocation();
  }

  Future<bool> _initializeLocation() async {
    final position = await LocationUtil.getCurrentLocation();
    if (position != null && mounted) {
      setState(() {
        _currentLatitude = position.latitude;
        _currentLongitude = position.longitude;
      });

      if (mapboxMap != null && _circleAnnotationManager != null) {
        await _updateUserAnnotationFromCoords(_currentLatitude!, _currentLongitude!);
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<bool>(
        future: _locationFuture,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ThreeRotatingDots(
                color: appScheme.primaryColor,
                size: 30,
              ),
            );
          }
          return StreamBuilder<geo.Position>(
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
                  mapbox.MapWidget(
                    onMapCreated: (mapbox.MapboxMap controller) async {
                      mapboxMap = controller;
                      _circleAnnotationManager = await mapboxMap!.annotations.createCircleAnnotationManager();
                      if (_currentLatitude != null && _currentLongitude != null) {
                        await _updateUserAnnotationFromCoords(_currentLatitude!, _currentLongitude!);
                        await mapboxMap!.setCamera(
                          mapbox.CameraOptions(
                            center: mapbox.Point(coordinates: mapbox.Position(_currentLongitude!, _currentLatitude!)),
                            zoom: 15,
                          ),
                        );
                      }
                    },
                    cameraOptions: mapbox.CameraOptions(
                      center: mapbox.Point(coordinates: mapbox.Position(_currentLongitude ?? 0, _currentLatitude ?? 0)),
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
                            mapbox.CameraOptions(
                              center: mapbox.Point(coordinates: mapbox.Position(_currentLongitude!, _currentLatitude!)),
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
          );
        },
      ),
    );
  }

  Future<void> _updateUserAnnotationFromCoords(double lat, double lon) async {
    if (_circleAnnotationManager == null || mapboxMap == null) return;

    try {
      final options = mapbox.CircleAnnotationOptions(
        geometry: mapbox.Point(coordinates: mapbox.Position(lon, lat)),
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
