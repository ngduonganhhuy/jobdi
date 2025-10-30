import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

class StatWorkItem extends StatelessWidget {
  const StatWorkItem({
    required this.label,
    required this.value,
    required this.icon,
    this.children = const [],
    super.key,
  });
  final String label;
  final String value;
  final String icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
          if (children.isNotEmpty) ...[
            const Gap(12),
            ...children,
          ],
        ],
      ),
    );
  }
}
