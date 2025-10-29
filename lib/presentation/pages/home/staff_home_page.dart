import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:jobdi/core/env/env.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart' show PNGAsset, SVGAsset;
import 'package:jobdi/core/utils/location_util.dart' show LocationUtil;
import 'package:jobdi/core/utils/utils.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/custom_switch.dart';
import 'package:jobdi/widgets/gap.dart';
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
  bool isFindWorkAround = true;

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
        await _updateUserAnnotationFromCoords(
          _currentLatitude!,
          _currentLongitude!,
        );
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
                  _updateUserAnnotationFromCoords(
                    _currentLatitude!,
                    _currentLongitude!,
                  );
                }
              }

              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: mapbox.MapWidget(
                                      onMapCreated:
                                          (mapbox.MapboxMap controller) async {
                                            mapboxMap = controller;
                                            _circleAnnotationManager =
                                                await mapboxMap!.annotations
                                                    .createCircleAnnotationManager();
                                            if (_currentLatitude != null &&
                                                _currentLongitude != null) {
                                              await _updateUserAnnotationFromCoords(
                                                _currentLatitude!,
                                                _currentLongitude!,
                                              );
                                              await mapboxMap!.setCamera(
                                                mapbox.CameraOptions(
                                                  center: mapbox.Point(
                                                    coordinates:
                                                        mapbox.Position(
                                                          _currentLongitude!,
                                                          _currentLatitude!,
                                                        ),
                                                  ),
                                                  zoom: 15,
                                                ),
                                              );
                                            }
                                          },
                                      cameraOptions: mapbox.CameraOptions(
                                        center: mapbox.Point(
                                          coordinates: mapbox.Position(
                                            _currentLongitude ?? 0,
                                            _currentLatitude ?? 0,
                                          ),
                                        ),
                                        zoom: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -20),
                                  child: Container(
                                    margin: REdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    padding: REdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appScheme.primaryColor100,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 56.r + 4,
                                        ),
                                        Expanded(
                                          child: SemiBoldText(
                                            'Tìm việc quanh đây',
                                            color: appScheme.gray900,
                                            fontSize: 16,
                                          ),
                                        ),
                                        CustomSwitch(
                                          isOn: isFindWorkAround,
                                          onToggle: (value) {
                                            setState(() {
                                              isFindWorkAround = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 16.r,
                              bottom: 20,
                              child: Image.asset(
                                PNGAsset.scope_person,
                                width: 56.r,
                                height: 70.r,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      RPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            AppSvgImage(
                              assetName: SVGAsset.icon_pause,
                              width: 24.r,
                              height: 24.r,
                            ),
                            const Gap(8),
                            MediumText(
                              'Đang ngưng nhận việc',
                              color: appScheme.gray400,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                      const Gap(44),
                      RPadding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SemiBoldText(
                          'Hôm nay',
                          fontSize: 14,
                          color: appScheme.black,
                        ),
                      ),
                      const Gap(16),
                      RPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RegularText(
                                    'Thu nhập',
                                    fontSize: 14,
                                    color: appScheme.gray500,
                                  ),
                                  const Gap(8),
                                  SemiBoldText(
                                    '${Utils.formatNumber(100000)}đ',
                                    color: appScheme.black,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(6),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  RegularText(
                                    'Đã hoàn thành',
                                    fontSize: 14,
                                    color: appScheme.gray500,
                                  ),
                                  const Gap(8),
                                  SemiBoldText(
                                    '12 việc',
                                    color: appScheme.black,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(6),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  RegularText(
                                    'Đánh giá',
                                    fontSize: 14,
                                    color: appScheme.gray500,
                                  ),
                                  const Gap(8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SemiBoldText(
                                        '5.0',
                                        color: appScheme.black,
                                        fontSize: 14,
                                      ),
                                      const Gap(4),
                                      AppSvgImage(
                                        assetName: SVGAsset.icon_star,
                                        width: 22.r,
                                        height: 22.r,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),

                  // Positioned(
                  //   right: 16,
                  //   bottom: 16,
                  //   child: FloatingActionButton(
                  //     backgroundColor: Colors.white,
                  //     onPressed: () async {
                  //       if (_currentLatitude != null &&
                  //           _currentLongitude != null &&
                  //           mapboxMap != null) {
                  //         await mapboxMap!.setCamera(
                  //           mapbox.CameraOptions(
                  //             center: mapbox.Point(
                  //               coordinates: mapbox.Position(
                  //                 _currentLongitude!,
                  //                 _currentLatitude!,
                  //               ),
                  //             ),
                  //             zoom: 15,
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     child: const Icon(
                  //       Icons.my_location,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
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
