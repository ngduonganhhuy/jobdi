import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart';

class StaffFeatureButton extends StatelessWidget {
  const StaffFeatureButton({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final String icon;
  final String label;
  final VoidCallback onTap;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClickWidget(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            AppSvgImage(
              assetName: icon,
              width: 24.r,
              height: 24.r,
            ),
            const Gap(8),
            MediumText(
              label,
              color: appScheme.gray900,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
