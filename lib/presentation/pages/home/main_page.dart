import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';

class MainPage extends StatefulWidget implements BasePage {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  String get screenName => 'MainPage';
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: AppSvgImage(
                assetName: SVGAsset.icon_home,
                width: 24.r,
                height: 24.r,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: AppSvgImage(
                assetName: SVGAsset.icon_activity,
                width: 24.r,
                height: 24.r,
              ),
              label: 'Hoạt động',
            ),
            BottomNavigationBarItem(
              icon: AppSvgImage(
                assetName: SVGAsset.icon_calendar,
                width: 24.r,
                height: 24.r,
              ),
              label: 'Lịch làm',
            ),
            BottomNavigationBarItem(
              icon: AppSvgImage(
                assetName: SVGAsset.icon_message,
                width: 24.r,
                height: 24.r,
              ),
              label: 'Tin nhắn',
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
