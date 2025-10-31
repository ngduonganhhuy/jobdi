import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/gender.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart' show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';

class MapsPickerBottomSheet extends BottomSheetWidget {
  const MapsPickerBottomSheet({super.key});
  @override
  double? get maxHeight => 282.h;
  @override
  State<BottomSheetWidget> createState() => _SelectGenderBottomSheetState();
}

class _SelectGenderBottomSheetState extends BottomSheetWidgetState<MapsPickerBottomSheet> {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appScheme.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 0,
            child: ClickWidget(
              onTap: () => NavigatorService.goBack<void>(context),
              child: const AppSvgImage(assetName: SVGAsset.icon_close),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(Gender value) {
    return RegularText(
      value.displayName,
      color: appScheme.gray900,
      fontSize: 14,
    );
  }
}
