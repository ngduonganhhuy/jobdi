import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/category_entity.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/gap.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 14.r) / 2;
        return Wrap(
          runSpacing: 21.r,
          spacing: 14.r,
          children: [
            ...CategoryEntity.mockList.map((cate) {
              return SizedBox(
                width: itemWidth,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            cate.image,
                            width: 40.r,
                            height: 40.r,
                          ),
                          const Gap(8),
                          MediumText(
                            cate.title,
                            fontSize: 12,
                            color: appScheme.gray900,
                          ),
                          const Gap(2),
                          RegularText(
                            cate.description,
                            fontSize: 12,
                            color: appScheme.gray300,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        children: <Widget>[
                          AppSvgImage(
                            assetName: SVGAsset.icon_staff,
                            width: 16.r,
                            height: 16.r,
                          ),
                          const Gap(4),
                          MediumText(
                            '${cate.quantity} thợ',
                            fontSize: 10,
                            color: appScheme.gray700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
