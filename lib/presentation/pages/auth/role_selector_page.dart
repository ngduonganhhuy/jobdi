import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/domain/entities/role_entity.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart' show RegularText, SemiBoldText;
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/common_app_bar.dart' show CommonAppBar;
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart';

class RoleSelectorPage extends StatefulWidget implements BasePage {
  const RoleSelectorPage({super.key});

  @override
  State<RoleSelectorPage> createState() => _RoleSelectorPageState();

  @override
  String get screenName => 'RoleSelectorPage';
}

class _RoleSelectorPageState extends State<RoleSelectorPage> {
  late final AppBloc _appBloc = locator<AppBloc>();
  late final ThemeBloc _themeBloc = locator<ThemeBloc>();

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        appBar: CommonAppBar(title: 'Chọn thợ'),
        backgroundColor: appScheme.primaryColor,
        body: Container(
          width: double.infinity,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(8),
              SemiBoldText(
                'Anh/chị là khách hàng hay thợ?',
                fontSize: 20,
                color: appScheme.gray900,
              ),
              const Gap(8),
              RegularText(
                'Chọn vai trò của anh/chị trên app Jobdee',
                fontSize: 14,
                color: appScheme.gray500,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    const Gap(56),
                    ...RoleEntity.values.map((RoleEntity role) {
                      return BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          final isSelected = _appBloc.role == role;
                          final color = isSelected
                              ? appScheme.primaryColor.withValues(alpha: 0.5)
                              : appScheme.white;
                          final borderColor = isSelected
                              ? appScheme.primaryColor
                              : appScheme.gray200;

                          return ClickWidget(
                            onTap: () {
                              _appBloc.setRole(role);
                              _themeBloc.add(
                                ToggleThemeEvent(theme: role.theme),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 256.w,
                                  margin: const EdgeInsets.only(top: 24),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: color,
                                    border: Border.all(
                                      color: borderColor,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(role.image),
                                      const Gap(16),
                                      SemiBoldText(
                                        role.name,
                                        fontSize: 16,
                                        color: appScheme.gray800,
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  top: 38,
                                  left: 14,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: borderColor,
                                    ),
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appScheme.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
              const Spacer(),
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
}
