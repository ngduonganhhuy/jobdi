import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart' show AppBloc;
import 'package:jobdi/core_bloc/theme/theme_bloc.dart'
    show ThemeBloc, ToggleThemeEvent;
import 'package:jobdi/domain/entities/role_entity.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart';

class HomePage extends StatefulWidget implements BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  String get screenName => 'HomePage';
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  late final AppBloc _appBloc = locator<AppBloc>();
  late final ThemeBloc _themeBloc = locator<ThemeBloc>();
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      bottom: true,
      color: appScheme.white,
      child: Scaffold(
        backgroundColor: appScheme.white,
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  margin: REdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  padding: REdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: appScheme.primaryColor50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    indicator: const BoxDecoration(),
                    controller: _tabController,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 0,
                    tabs: [
                      ...RoleEntity.values.map(
                        (role) {
                          final isSelected = _appBloc.role == role;
                          return Tab(
                            child: ClickWidget(
                              onTap: () {
                                _appBloc.setRole(role);
                                _themeBloc.add(
                                  ToggleThemeEvent(theme: role.theme),
                                );
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? appScheme.primaryColor200
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      role.image,
                                      width: 24.r,
                                      height: 24.r,
                                    ),
                                    const Gap(4),
                                    RegularText(
                                      role.name,
                                      fontSize: 12,
                                      color: appScheme.gray900,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                RPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      SemiBoldText(
                        '👋',
                        fontSize: 24,
                        color: appScheme.gray900,
                      ),
                      const Gap(16),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Xin chào,\n',
                            style: appFont.useFont(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: appScheme.gray400,
                            ),
                            children: [
                              TextSpan(
                                text: '140 thợ ',
                                style: appFont.useFont(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: appScheme.blue500,
                                ),
                              ),
                              TextSpan(
                                text: 'đang sẵn sàng phục vụ bạn!',
                                style: appFont.useFont(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: appScheme.gray700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),
                Container(
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
                      RPadding(
                        padding: const EdgeInsets.only(
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
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: appScheme.black.withValues(alpha: .05),
                      offset: const Offset(0, -4),
                      blurRadius: 10,
                    ),
                  ],
                  color: appScheme.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(
                      'Đăng nhập để khám phá JOBDEE ngay!',
                      color: appScheme.gray900,
                      fontSize: 16,
                    ),
                    const Gap(20),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: PrimaryButton(
                            onTap: () {
                              NavigatorService.goToLoginPage(context);
                            },
                            label: 'Đăng nhập',
                            textColor: appScheme.primaryColor,
                            startColor: appScheme.primaryColor50,
                            endColor: appScheme.primaryColor50,
                          ),
                        ),
                        const Gap(16),
                        Flexible(
                          child: PrimaryButton(
                            onTap: () {
                              NavigatorService.goToRegisterPage(context);
                            },
                            label: 'Đăng ký',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
