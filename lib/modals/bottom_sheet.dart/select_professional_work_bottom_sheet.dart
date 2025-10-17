import 'dart:math' as math show pi;

import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/domain/entities/gender.dart';
import 'package:jobdi/domain/entities/professional_work.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget, BottomSheetWidgetState;
import 'package:jobdi/modals/bottom_sheet.dart/select_option_bottom_sheet.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/common_checkbox.dart';
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart' show Gap;

class SelectProfessionalWorkBottomSheet extends BottomSheetWidget {
  const SelectProfessionalWorkBottomSheet({
    required this.initialWorks,
    required this.onChange,
    super.key,
  });
  final List<Enum> initialWorks;
  final void Function(List<Enum> value) onChange;
  @override
  State<BottomSheetWidget> createState() =>
      _SelectProfessionalWorkBottomSheetState();
}

class _SelectProfessionalWorkBottomSheetState
    extends BottomSheetWidgetState<SelectProfessionalWorkBottomSheet> {
  late final Map<WorkingGroup, List<Enum>> _workingGroups = {
    WorkingGroup.family: Family.values,
    WorkingGroup.pet: Pet.values,
  };
  late final Map<WorkingGroup, ExpandableController> _workingControllers = {
    WorkingGroup.family: ExpandableController(),
    WorkingGroup.pet: ExpandableController(),
  };

  late final List<Enum> _selectedWorks;

  @override
  void initState() {
    _selectedWorks = widget.initialWorks;
    super.initState();
  }

  @override
  void dispose() {
    for (final element in _workingControllers.entries) {
      element.value.dispose();
    }
    super.dispose();
  }

  bool isGroupChecked(List<Enum> children) {
    return _selectedWorks.isNotEmpty &&
        children.every(
          (element) => _selectedWorks.contains(element),
        );
  }

  void checkPermission(Enum value) {
    if (_selectedWorks.contains(value)) {
      _selectedWorks
        ..remove(value)
        ..toSet();
    } else {
      _selectedWorks
        ..add(value)
        ..toSet();
    }
    widget.onChange.call(_selectedWorks);
    setState(() {});
  }

  void checkGroupPermission(
    List<Enum> value, {
    required bool prevValueChecked,
  }) {
    if (prevValueChecked) {
      _selectedWorks
        ..removeWhere(
          (element) => value.expand((element) => [element]).contains(element),
        )
        ..toSet();
    } else {
      _selectedWorks
        ..addAll(value.expand((element) => [element]))
        ..toSet();
    }
    widget.onChange.call(_selectedWorks);
    setState(() {});
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
                  'Công việc chuyên môn',
                  color: appScheme.gray900,
                  fontSize: 16,
                ),
              ),
              const Gap(4),
              Center(
                child: RegularText(
                  'Tối đa 15 chuyên môn',
                  color: appScheme.gray400,
                  fontSize: 12,
                ),
              ),
              Divider(
                height: 24,
                thickness: 0.5,
                color: appScheme.gray200,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: appScheme.black.withValues(alpha: .05),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CustomTextField(
                  hintStyle: appFont.useFont(
                    color: appScheme.gray500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Tìm theo tên hoặc nhóm công việc',
                  prefix: const AppSvgImage(
                    assetName: SVGAsset.icon_search_outline,
                    width: 24,
                    height: 24,
                  ),
                  fillColor: appScheme.white,
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: appScheme.gray200,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              ..._workingGroups.entries.map(
                (work) => ListenableBuilder(
                  listenable: _workingControllers[work.key]!,
                  builder: (context, child) {
                    return Expandable(
                      theme: const ExpandableThemeData(
                        crossFadePoint: 0.5,
                        fadeCurve: Curves.easeIn,
                      ),
                      controller: _workingControllers[work.key],
                      collapsed: buildCollapseTitleGroup(work.key, work.value),
                      expanded: buildExpandItems(work.key, work.value),
                    );
                  },
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

  Widget buildCollapseTitleGroup(Enum parent, List<Enum> listPermissions) {
    final isChecked = isGroupChecked(listPermissions);
    return ClickWidget(
      onTap: () => _workingControllers[parent]?.toggle(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: appScheme.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: <Widget>[
            _buildPrefix(),
            const Gap(8),
            Expanded(
              child: RegularText(
                parent.label,
                fontSize: 14,
                color: appScheme.gray900,
              ),
            ),
            CommonCheckbox(
              onChanged: (_) {
                checkGroupPermission(
                  listPermissions,
                  prevValueChecked: isChecked,
                );
              },
              isChecked: isChecked,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrefix() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: appScheme.gray25,
        shape: BoxShape.circle,
      ),
      child: const AppSvgImage(
        assetName: SVGAsset.icon_chevron_right_fill,
      ),
    );
  }

  Widget buildExpandItems(Enum parent, List<Enum> listWorks) {
    final isParentChecked = isGroupChecked(listWorks);
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: appScheme.gray25,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClickWidget(
            onTap: () => _workingControllers[parent]?.toggle(),
            child: Row(
              children: <Widget>[
                Transform.rotate(
                  angle: math.pi / 2,
                  child: _buildPrefix(),
                ),
                const Gap(8),
                Expanded(
                  child: MediumText(
                    parent.label,
                    color: appScheme.gray900,
                    fontSize: 14,
                  ),
                ),
                CommonCheckbox(
                  onChanged: (_) => checkGroupPermission(
                    listWorks,
                    prevValueChecked: isParentChecked,
                  ),
                  isChecked: isParentChecked,
                ),
              ],
            ),
          ),
          const Gap(12),
          ...listWorks.mapIndexed((index, work) {
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 0 : 12),
              child: ClickWidget(
                onTap: () => checkPermission(work),
                child: Row(
                  children: <Widget>[
                    Opacity(opacity: 0, child: _buildPrefix()),
                    const Gap(8),
                    Expanded(
                      child: RegularText(
                        work.label,
                        color: appScheme.gray900,
                        fontSize: 14,
                      ),
                    ),
                    CommonCheckbox(
                      onChanged: (_) => checkPermission(work),
                      isChecked: _selectedWorks.contains(work),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
