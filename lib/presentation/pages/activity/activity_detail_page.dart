import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

class ActivityDetailPage extends StatefulWidget implements BasePage {
  const ActivityDetailPage({super.key});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();

  @override
  String get screenName => 'ActivityDetailPage';
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  late final ValueNotifier<Duration> _elapsedNotifier;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _elapsedNotifier = ValueNotifier(_calcElapsed());

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedNotifier.value = _calcElapsed();
    });
  }

  Duration _calcElapsed() {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    final elapsedSeconds = now - mockActivityDetail.timeStarted;
    return Duration(seconds: elapsedSeconds);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _elapsedNotifier.dispose();
    super.dispose();
  }

  String formatTime(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    return '$hours Giờ $minutes Phút $seconds Giây';
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.white,
        body: ListView(
          children: [
            const Gap(20),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SemiBoldText(
                      mockActivityDetail.status.label,
                      color: appScheme.gray900,
                      fontSize: 16,
                    ),
                    const Gap(4),
                    if (mockActivityDetail.status ==
                        AcitivityDetailStatus.working)
                      ValueListenableBuilder(
                        valueListenable: _elapsedNotifier,
                        builder: (context, value, child) {
                          return SemiBoldText(
                            formatTime(value.inSeconds),
                            color: appScheme.orange500,
                            fontSize: 14,
                          );
                        },
                      ),
                  ],
                ),
                const Gap(12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appScheme.orange50,
                    shape: BoxShape.circle,
                  ),
                  child: AppSvgImage(
                    assetName: mockActivityDetail.status.icon,
                    width: 40.r,
                    height: 40.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
