import 'package:flutter/material.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_text.dart';

class ActivityPage extends StatefulWidget implements BasePage {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();

  @override
  String get screenName => 'ActivityPage';
}

class _ActivityPageState extends State<ActivityPage> with TickerProviderStateMixin {
  late final _tabbarController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appScheme.white,
          title: SemiBoldText(
            'Hoạt động',
            color: appScheme.black,
            fontSize: 18,
          ),
        ),
        body: TabBar(
          tabs: const [
            Tab(text: 'Gần đây nhất'),
            Tab(text: 'Việc tức thì'),
            Tab(text: 'Việc định kỳ'),
            Tab(text: 'Đã hủy'),
          ],
          controller: _tabbarController,
        ),
      ),
    );
  }
}
