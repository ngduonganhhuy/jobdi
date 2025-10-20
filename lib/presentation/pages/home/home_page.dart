import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart' show AppBloc;
import 'package:jobdi/core_bloc/theme/theme_bloc.dart' show ThemeBloc, ToggleThemeEvent;
import 'package:jobdi/domain/entities/role_entity.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart';

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
      child: Scaffold(
        body: Column(
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
                              color: isSelected ? appScheme.primaryColor200 : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(role.image, width: 24.r, height: 24.r),
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
            Row(
              children: <Widget>[
                SemiBoldText(
                  '👋',
                  fontSize: 24,
                  color: appScheme.gray900,
                ),
                const Gap(16),
                RichText(
                  text: TextSpan(
                    text: 'Xin chào,\n',
                    style: appFont.useFont(fontWeight: FontWeight.w400, fontSize: 16, color: appScheme.gray400),
                    children: [
                      TextSpan(
                        text: '140 thợ ',
                        style: appFont.useFont(fontWeight: FontWeight.w600, fontSize: 20, color: appScheme.blue500),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
