import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/custom_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: appScheme.primaryColor.withValues(alpha: .1),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: appScheme.primaryColor),
            gradient: LinearGradient(
              begin: const Alignment(0.65, -0.76),
              end: const Alignment(-0.65, 0.76),
              colors: [
                appScheme.primaryColor,
                appScheme.primaryColor600,
              ],
              stops: const [0.1417, 0.9008],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: REdgeInsets.only(
                  top: 6,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                child: MediumText(
                  'Tìm thợ quanh đây',
                  color: appScheme.white,
                  fontSize: 16,
                ),
              ),
              CustomTextField(
                prefix: AppSvgImage(
                  assetName: SVGAsset.bag,
                  width: 24.r,
                  height: 24.r,
                ),
                contentPadding: REdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 21,
                ),
                hintText: 'Bạn đang bị vấn đề gì...?',
                hintStyle: appFont.useFont(
                  fontWeight: FontWeight.w400,
                  color: appScheme.gray400,
                  fontSize: 14,
                ),
                inputBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
