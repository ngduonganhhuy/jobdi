import 'package:flutter/material.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart';

class SelecteYearBottomSheet extends BottomSheetWidget {
  const SelecteYearBottomSheet({super.key});

  @override
  State<BottomSheetWidget> createState() => _SelecteYearBottomSheetState();
}

class _SelecteYearBottomSheetState
    extends BottomSheetWidgetState<SelecteYearBottomSheet> {
  final List<int> listYears = List.generate(
    100,
    (index) => DateTime.now().year - index,
  );
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
                  'Năm sinh',
                  color: appScheme.gray900,
                  fontSize: 16,
                ),
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, i) => buildRow(listYears[i]),
                  separatorBuilder: (c, u) => Divider(
                    color: appScheme.gray100,
                    thickness: 0.5,
                    height: 25,
                  ),
                  itemCount: listYears.length,
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

  Widget buildRow(int value) {
    return RegularText(
      value.toString(),
      color: appScheme.gray900,
      fontSize: 14,
    );
  }
}
