import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

class StaffInfoSection extends StatelessWidget {
  const StaffInfoSection({
    required this.activityDetail,
    required this.formattedJobs,
    super.key,
  });
  final ActivityDetailEntity activityDetail;
  final String formattedJobs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: AppNetWorkImage(
              url: activityDetail.work.staff.image,
              width: 40.r,
              height: 40.r,
            ),
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SemiBoldText(
                    activityDetail.work.staff.name,
                    fontSize: 14,
                    color: appScheme.gray900,
                  ),
                  const Gap(16),
                  RegularText(
                    activityDetail.work.staff.rating.toString(),
                    color: appScheme.black,
                    fontSize: 14,
                  ),
                  const Gap(4),
                  SizedBox(
                    width: 24.r,
                    height: 24.r,
                    child: AppSvgImage(
                      assetName: SVGAsset.icon_star,
                      width: 24.r,
                      height: 24.r,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              const Gap(2),
              RegularText(
                'Thợ $formattedJobs',
                fontSize: 12,
                color: appScheme.gray500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
