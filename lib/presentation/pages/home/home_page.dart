import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/services/api_service/api_service.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart' show NavigatorService;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart' show AppBloc;
import 'package:jobdi/core_bloc/theme/theme_bloc.dart' show ThemeBloc, ToggleThemeEvent;
import 'package:jobdi/domain/entities/role_entity.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/presentation/pages/home/client_home_page.dart' show ClientHomePage;
import 'package:jobdi/presentation/pages/home/staff_home_page.dart' show StaffHomePage;
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart' show PrimaryButton;

class HomePage extends StatefulWidget implements BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  String get screenName => 'HomePage';
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  late final ThemeBloc _themeBloc = locator<ThemeBloc>();
  late final AppBloc _appBloc = locator<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      top: true,
      bottom: true,
      color: appScheme.white,
      child: Scaffold(
        backgroundColor: appScheme.white,
        body: Stack(
          children: [
            Column(
              children: [
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
                                  color: isSelected ? appScheme.primaryColor200 : Colors.transparent,
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
                if (_appBloc.role == RoleEntity.client) const ClientHomePage() else const StaffHomePage(),
              ],
            ),
            if (ApiService.hasToken)
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
