import 'package:flutter/material.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/domain/entities/administrative_unit.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart';

class SelectAdministrativeUnitBottomSheet extends BottomSheetWidget {
  const SelectAdministrativeUnitBottomSheet({
    required this.listData,
    required this.title,
    super.key,
  });
  final List<AdministrativeUnit> listData;
  final String title;
  @override
  State<BottomSheetWidget> createState() =>
      _SelectAdministrativeUnitBottomSheetState();
}

class _SelectAdministrativeUnitBottomSheetState
    extends BottomSheetWidgetState<SelectAdministrativeUnitBottomSheet> {
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
                  widget.title,
                  color: appScheme.gray900,
                  fontSize: 16,
                ),
              ),
              const Gap(10),
              const CustomTextField(
                hintText: 'Tìm kiếm',
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, i) => buildRow(widget.listData[i]),
                  separatorBuilder: (c, u) => Divider(
                    color: appScheme.gray100,
                    thickness: 0.5,
                    height: 25,
                  ),
                  itemCount: widget.listData.length,
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

  Widget buildRow(AdministrativeUnit value) {
    return RegularText(
      value.name,
      color: appScheme.gray900,
      fontSize: 14,
    );
  }
}
