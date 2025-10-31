import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/utils/time_formatter.dart' show TimeFormatter;
import 'package:jobdi/domain/entities/activity_detail_entity.dart' show mockActivityDetail;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart';

class ActivityScheduleBox extends StatelessWidget {
  const ActivityScheduleBox({super.key, this.isShowTitle = true});
  final bool isShowTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appScheme.white,
        border: Border.all(color: appScheme.gray200, width: 0.5),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: appScheme.black.withValues(alpha: .05),
            offset: const Offset(0, 4),
            blurRadius: 25,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          if (isShowTitle) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: MediumText(
                    'Buổi ${mockActivityDetail.scheduleWork.currentSession}',
                    color: appScheme.black,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: appScheme.blue50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MediumText(
                    TimeFormatter.timeRemainingText(
                      mockActivityDetail.scheduleWork.timeStarted,
                    ),
                    color: appScheme.gray900,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Gap(16),
          ],
          Row(
            children: <Widget>[
              Expanded(
                child: RegularText(
                  'Thời gian bắt đầu',
                  color: appScheme.gray400,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: MediumText(
                  mockActivityDetail.scheduleWork.displayTimeStarted,
                  color: appScheme.gray900,
                  fontSize: 14,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            children: <Widget>[
              Expanded(
                child: RegularText(
                  'Thời gian làm việc',
                  color: appScheme.gray400,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: MediumText(
                  mockActivityDetail.scheduleWork.displayTimeWorking,
                  color: appScheme.gray900,
                  fontSize: 14,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            children: <Widget>[
              Flexible(
                child: SmallButton(
                  bgColor: appScheme.red50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AppSvgImage(
                        assetName: SVGAsset.icon_edit_calendar,
                        width: 24.r,
                        height: 24.r,
                        color: appScheme.red500,
                      ),
                      const Gap(8),
                      SemiBoldText(
                        'Huỷ lịch',
                        fontSize: 14,
                        color: appScheme.red500,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              Flexible(
                child: SmallButton(
                  bgColor: appScheme.gray50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AppSvgImage(
                        assetName: SVGAsset.icon_edit_calendar,
                        width: 24.r,
                        height: 24.r,
                        color: appScheme.gray900,
                      ),
                      const Gap(8),
                      SemiBoldText(
                        'Dời lịch',
                        fontSize: 14,
                        color: appScheme.gray900,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
