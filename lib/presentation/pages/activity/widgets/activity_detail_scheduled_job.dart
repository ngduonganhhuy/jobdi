import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/activity_detail_entity.dart'
    show mockActivityDetail;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart'
    show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/gap.dart' show Gap;
import 'package:jobdi/widgets/primary_button.dart';

class ActivityDetailScheduledJob extends StatelessWidget {
  const ActivityDetailScheduledJob({super.key});

  String timeRemainingText(int timestamp) {
    final now = DateTime.now();
    final target = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final diff = target.difference(now);

    if (diff.isNegative) {
      return 'Đã hết hạn';
    }

    final hours = diff.inHours;
    if (hours >= 24) {
      final days = diff.inDays;
      return 'Còn $days ngày';
    } else {
      return 'Còn $hours giờ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: <Widget>[
            SemiBoldText(
              mockActivityDetail.work.title,
              color: appScheme.gray900,
              fontSize: 18,
            ),
            const Gap(10),
            mockActivityDetail.work.status.statusWidget,
          ],
        ),
        const Gap(4),
        RegularText(
          'Mã đơn: #${mockActivityDetail.work.id}',
          color: appScheme.gray400,
          fontSize: 14,
        ),
        const Gap(12),
        Container(
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
                      timeRemainingText(
                        mockActivityDetail.scheduleWork.timeStarted,
                      ),
                      color: appScheme.gray900,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Gap(16),
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
        ),
      ],
    );
  }

  Widget _buildStatWork(
    String label,
    String value,
    String icon,
    List<Widget> children,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          AppSvgImage(
            assetName: icon,
            width: 24.r,
            height: 24.r,
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RegularText(
                  label,
                  color: appScheme.gray400,
                  fontSize: 14,
                ),
                MediumText(
                  value,
                  color: appScheme.gray900,
                  fontSize: 14,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const Gap(12),
          ...children,
        ],
      ),
    );
  }
}
