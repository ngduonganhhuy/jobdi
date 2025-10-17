import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/gender.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart' show Gap;

class SelectGenderBottomSheet extends BottomSheetWidget {
  const SelectGenderBottomSheet({super.key});
  @override
  double? get maxHeight => 282.h;
  @override
  State<BottomSheetWidget> createState() => _SelectGenderBottomSheetState();
}

class _SelectGenderBottomSheetState
    extends BottomSheetWidgetState<SelectGenderBottomSheet> {
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
          Column(
            children: <Widget>[
              Center(
                child: SemiBoldText(
                  'Giới tính',
                  color: appScheme.gray900,
                  fontSize: 16,
                ),
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, i) => buildRow(Gender.values[i]),
                  separatorBuilder: (c, u) => Divider(
                    color: appScheme.gray100,
                    thickness: 0.5,
                    height: 25,
                  ),
                  itemCount: Gender.values.length,
                ),
              ),
            ],
          ),
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
