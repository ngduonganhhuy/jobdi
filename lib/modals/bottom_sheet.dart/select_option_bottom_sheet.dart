import 'package:flutter/material.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/domain/entities/professional_work.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;

extension EnumExt on Enum {
  List<dynamic> get values {
    if (this is WorkingGroup) return (this as WorkingGroup).values;
    if (this is Family) return (this as Family).values;
    if (this is Pet) return (this as Pet).values;
    return [];
  }

  String get label {
    if (this is WorkingGroup) return (this as WorkingGroup).label;
    if (this is Family) return (this as Family).label;
    if (this is Pet) return (this as Pet).label;
    return '';
  }
}

class SelectOptionBottomSheet<T extends Enum> extends BottomSheetWidget {
  const SelectOptionBottomSheet({
    required this.title,
    required this.options,
    required this.selectedOption,
    super.key,
  });
  final String title;
  final List<T> options;
  final T? selectedOption;

  @override
  State<BottomSheetWidget> createState() => _SelectOptionBottomSheetState<T>();
}

class _SelectOptionBottomSheetState<T>
    extends BottomSheetWidgetState<SelectOptionBottomSheet> {
  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SemiBoldText(
            widget.title,
            fontSize: 16,
            color: appScheme.gray900,
          ),
          const SizedBox(height: 20),
          ...widget.options.map((e) => _buildOption(context, e)),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, Enum option) {
    // final isSelected = option == widget.selectedOption;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClickWidget(
        onTap: () {
          NavigatorService.goBack(context, option);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: MediumText(
                  option.label,
                  fontSize: 14,
                  color: appScheme.gray700,
                ),
              ),
              const SizedBox(height: 10),
              // if (isSelected)
              //   AppSvgImage(
              //     assetName: SVGAsset.icon_check_circle,
              //     width: 20,
              //     height: 20,
              //     color: appScheme.primaryColor,
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
