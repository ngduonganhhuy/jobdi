import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              _buildHeader('Chương trình'),
              const Gap(4),
              _buildIconHot(),
            ],
          ),
        ),
        const Gap(13),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ...[
                PNGAsset.img1,
                PNGAsset.img1,
                PNGAsset.img1,
              ].asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final image = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: index == 2 ? 16 : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        image,
                        width: 180.w,
                        height: 80.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(String label) {
    return MediumText(
      label,
      fontSize: 16,
      color: appScheme.gray900,
    );
  }

  Widget _buildIconHot() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: appScheme.red50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SemiBoldText(
        'HOT 🔥',
        fontSize: 12,
        color: appScheme.red500,
      ),
    );
  }
}
