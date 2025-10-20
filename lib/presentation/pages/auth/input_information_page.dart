import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart';
import 'package:jobdi/domain/entities/administrative_unit.dart' show listProvinces, listWards;
import 'package:jobdi/domain/entities/custom_file.dart' show CustomFile;
import 'package:jobdi/domain/entities/role_entity.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/modals/bottom_sheet.dart/image_picker_bottom_sheet.dart' show ImagePickerBottomSheet;
import 'package:jobdi/modals/bottom_sheet.dart/select_administrative_unit_bottom_sheet.dart';
import 'package:jobdi/modals/bottom_sheet.dart/select_gender_bottom_sheet.dart';
import 'package:jobdi/modals/bottom_sheet.dart/select_professional_work_bottom_sheet.dart';
import 'package:jobdi/modals/bottom_sheet.dart/selecte_year_bottom_sheet.dart';
import 'package:jobdi/modals/modal_helper.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart' show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/avatar_widget.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/common_app_bar.dart';
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart' show Gap;
import 'package:jobdi/widgets/primary_button.dart' show SmallButton;

class InputInformationPage extends StatefulWidget implements BasePage {
  const InputInformationPage({super.key});

  @override
  State<InputInformationPage> createState() => _InputInformationPageState();

  @override
  String get screenName => 'InputInformationPage';
}

class _InputInformationPageState extends State<InputInformationPage> {
  late final AppBloc _appBloc = locator<AppBloc>();
  CustomFile? _selectedFile;
  List<Enum> _selectedWorks = [];

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.primaryColor,
        appBar: CommonAppBar(title: 'Thông tin cá nhân'),
        body: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: appScheme.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SemiBoldText(
                                    'Đăng ký làm khách hàng',
                                    fontSize: 20,
                                    color: appScheme.gray900,
                                  ),
                                  const Gap(8),
                                  RegularText(
                                    'Điền vào thông tin của anh/chị',
                                    fontSize: 14,
                                    color: appScheme.gray500,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(10),
                            Image.asset(_appBloc.role?.image ?? ''),
                          ],
                        );
                      },
                    ),
                    const Gap(12),
                    SemiBoldText(
                      'Ảnh đại diện',
                      fontSize: 14,
                      color: appScheme.gray900,
                    ),
                    const Gap(20),
                    if (_selectedFile == null)
                      Row(
                        children: <Widget>[
                          const AvatarWidget(
                            size: 40,
                            asset: PNGAsset.user_placeholder,
                          ),
                          const Gap(16),
                          ClickWidget(
                            onTap: () async {
                              _selectedFile = await ModalHelper.showBottomSheet<CustomFile>(
                                context: context,
                                bottomSheet: const ImagePickerBottomSheet(),
                              );
                              setState(() {});
                            },
                            child: Row(
                              children: <Widget>[
                                const AppSvgImage(
                                  assetName: SVGAsset.icon_upload,
                                ),
                                const Gap(6),
                                MediumText(
                                  'Chọn từ thư viện',
                                  color: appScheme.blue500,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: <Widget>[
                          AvatarWidget(
                            size: 40,
                            filepath: _selectedFile?.filePath,
                            userName: 'Jobdi',
                          ),
                          const Gap(16),
                          ClickWidget(
                            onTap: () async {
                              _selectedFile = await ModalHelper.showBottomSheet<CustomFile>(
                                context: context,
                                bottomSheet: const ImagePickerBottomSheet(),
                              );
                              setState(() {});
                            },
                            child: Row(
                              children: <Widget>[
                                const AppSvgImage(
                                  assetName: SVGAsset.icon_reload,
                                ),
                                const Gap(6),
                                MediumText(
                                  'Thay đổi ảnh',
                                  color: appScheme.blue500,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const Gap(24),
                    SemiBoldText(
                      'Thông tin cá nhân',
                      fontSize: 14,
                      color: appScheme.gray900,
                    ),
                    const Gap(12),
                    const CustomTextField(
                      hintText: 'Họ và tên',
                    ),
                    const Gap(12),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            onTap: () {
                              ModalHelper.showBottomSheet<void>(
                                context: context,
                                bottomSheet: const SelectGenderBottomSheet(),
                              );
                            },
                            readOnly: true,
                            hintText: 'Giới tính',
                            suffix: AppSvgImage(
                              assetName: SVGAsset.icon_chevron_down,
                              color: appScheme.gray800,
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: CustomTextField(
                            onTap: () {
                              ModalHelper.showBottomSheet<void>(
                                context: context,
                                bottomSheet: const SelecteYearBottomSheet(),
                              );
                            },
                            hintText: 'Năm sinh',
                            readOnly: true,
                            suffix: AppSvgImage(
                              assetName: SVGAsset.icon_chevron_down,
                              color: appScheme.gray800,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Gap(12),
                    const CustomTextField(
                      hintText: 'Địa chỉ hiện tại',
                    ),
                    const Gap(12),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            onTap: () {
                              ModalHelper.showBottomSheet<void>(
                                context: context,
                                bottomSheet: SelectAdministrativeUnitBottomSheet(
                                  listData: listProvinces,
                                  title: 'Thành phố',
                                ),
                              );
                            },
                            readOnly: true,
                            hintText: 'Thành phố',
                            suffix: AppSvgImage(
                              assetName: SVGAsset.icon_chevron_down,
                              color: appScheme.gray800,
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: CustomTextField(
                            onTap: () {
                              ModalHelper.showBottomSheet<void>(
                                context: context,
                                bottomSheet: SelectAdministrativeUnitBottomSheet(
                                  listData: listWards,
                                  title: 'Phường',
                                ),
                              );
                            },
                            hintText: 'Phường',
                            readOnly: true,
                            suffix: AppSvgImage(
                              assetName: SVGAsset.icon_chevron_down,
                              color: appScheme.gray800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        if (_appBloc.role == null || _appBloc.role == RoleEntity.client) {
                          return const SizedBox();
                        }
                        return buildWorkingField();
                      },
                    ),
                    const Gap(24),
                    SemiBoldText(
                      'Mã giới thiệu',
                      fontSize: 14,
                      color: appScheme.gray900,
                    ),
                    const Gap(12),
                    const CustomTextField(
                      hintText: 'Mã giới thiệu',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: SmallButton(
                        bgColor: appScheme.gray50,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            AppSvgImage(
                              assetName: SVGAsset.icon_arrow_left_long,
                              color: appScheme.gray900,
                            ),
                            const Gap(8),
                            SemiBoldText(
                              'Quay lại',
                              fontSize: 16,
                              color: appScheme.gray900,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: SmallButton(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SemiBoldText(
                              'Tiếp tục',
                              fontSize: 16,
                              color: appScheme.white,
                            ),
                            const Gap(8),
                            AppSvgImage(
                              assetName: SVGAsset.icon_arrow_right_long,
                              color: appScheme.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWorkingField() {
    return ClickWidget(
      onTap: () {
        ModalHelper.showBottomSheet<void>(
          context: context,
          bottomSheet: SelectProfessionalWorkBottomSheet(
            initialWorks: _selectedWorks,
            onChange: (value) {
              _selectedWorks = value;
            },
          ),
        ).then(
          (value) {
            setState(() {});
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        decoration: BoxDecoration(
          color: appScheme.gray25,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_selectedWorks.isEmpty)
              Expanded(
                child: RegularText(
                  'Công việc chuyên môn',
                  fontSize: 14,
                  color: appScheme.gray400,
                ),
              )
            else
              Expanded(
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: _selectedWorks.map((work) {
                    return Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: appScheme.white,
                        border: Border.all(color: appScheme.gray200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MediumText(
                            _enumLabel(work),
                            color: appScheme.gray900,
                            fontSize: 12,
                          ),
                          const Gap(8),
                          ClickWidget(
                            onTap: () {
                              _selectedWorks.remove(work);
                              setState(() {});
                            },
                            child: AppSvgImage(
                              assetName: SVGAsset.icon_close,
                              width: 16,
                              height: 16,
                              color: appScheme.gray400,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            const Gap(8),
            AppSvgImage(
              assetName: SVGAsset.icon_plus,
              width: 24,
              height: 24,
              color: appScheme.gray800,
            ),
          ],
        ),
      ),
    );
  }

  String _enumLabel(Enum value) {
    final raw = value.toString();
    final parts = raw.split('.');
    final name = parts.isNotEmpty ? parts.last : raw;
    return name.replaceAll('_', ' ');
  }
}
