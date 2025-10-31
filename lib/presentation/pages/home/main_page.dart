import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/presentation/pages/home/activity_page.dart';
import 'package:jobdi/presentation/pages/home/conversations_page.dart';
import 'package:jobdi/presentation/pages/home/home_page.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/gap.dart';

class MainPage extends StatefulWidget implements BasePage {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  String get screenName => 'MainPage';
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<_NavigationItem> _navigationItems = [
    _NavigationItem(
      icon: SVGAsset.icon_home,
      activeIcon: SVGAsset.icon_home_active,
      label: 'Trang chủ',
    ),
    _NavigationItem(
      icon: SVGAsset.icon_activity,
      activeIcon: SVGAsset.icon_activity_active,
      label: 'Hoạt động',
    ),
    _NavigationItem(
      icon: SVGAsset.icon_calendar,
      activeIcon: SVGAsset.icon_calendar_active,
      label: 'Lịch làm',
    ),
    _NavigationItem(
      icon: SVGAsset.icon_message,
      activeIcon: SVGAsset.icon_message_active,
      label: 'Tin nhắn',
    ),
  ];

  static const List<Widget> _pages = [
    HomePage(),
    ActivityPage(),
    Center(child: Text('Lịch làm')),
    ConversationsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.white,
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: appScheme.gray200,
        ),
        const Gap(10),
        BottomNavigationBar(
          currentIndex: _selectedIndex,
          elevation: 0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          backgroundColor: appScheme.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: appScheme.primaryColor,
          unselectedItemColor: appScheme.gray500,
          unselectedFontSize: 12.sp,
          selectedFontSize: 12.sp,
          selectedLabelStyle: appFont.useFont(
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: appFont.useFont(
            fontWeight: FontWeight.w500,
          ),
          onTap: _onItemTapped,
          items: _navigationItems
              .map((item) => item.toNavigationBarItem())
              .toList(),
        ),
      ],
    );
  }
}

class _NavigationItem {
  const _NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
  final String icon;
  final String activeIcon;
  final String label;

  BottomNavigationBarItem toNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: AppSvgImage(
          assetName: icon,
          width: 24.r,
          height: 24.r,
        ),
      ),
      activeIcon: _ActiveNavigationIcon(iconAsset: activeIcon),
      label: label,
    );
  }
}

class _ActiveNavigationIcon extends StatelessWidget {
  const _ActiveNavigationIcon({required this.iconAsset});
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appScheme.primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: AppSvgImage(
        assetName: iconAsset,
        width: 24.r,
        height: 24.r,
        color: appScheme.white,
      ),
    );
  }
}
