import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ActivityTimelineWidget extends StatelessWidget {
  const ActivityTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RSizedBox(
        height: 50,
        child: FixedTimeline.tileBuilder(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          builder: TimelineTileBuilder.connected(
            nodePositionBuilder: (context, index) => 0,
            indicatorPositionBuilder: (context, index) => 0,
            contentsBuilder: (context, index) {
              final itemStep = WorkingStatus.values[index];
              final itemShowLineProgress = WorkingStatus.values.length - 2;
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: index == itemShowLineProgress + 1
                          ? appScheme.gray200
                          : appScheme.green600,
                      shape: BoxShape.circle,
                    ),
                    child: AppSvgImage(
                      assetName: itemStep.iconTimeline,
                      width: 16.r,
                      height: 16.r,
                      color: appScheme.white,
                    ),
                  ),
                  if (index <= itemShowLineProgress)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: (1.sw - 8.r - 32.r - (20.r * 5)) / 5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: appScheme.green600,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: index == itemShowLineProgress
                          ? LinearProgressIndicator(
                              minHeight: 2,
                              color: appScheme.green600,
                              backgroundColor: appScheme.green100,
                            )
                          : const SizedBox(),
                    ),
                ],
              );
            },
            itemCount: WorkingStatus.values.length,
          ),
        ),
      ),
    );
  }
}
