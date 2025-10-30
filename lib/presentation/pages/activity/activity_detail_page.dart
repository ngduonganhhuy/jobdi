import 'package:flutter/material.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/presentation/pages/activity/widgets/activity_detail_scheduled_job.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/common_app_bar.dart';

class ActivityDetailPage extends StatefulWidget implements BasePage {
  const ActivityDetailPage({super.key});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();

  @override
  String get screenName => 'ActivityDetailPage';
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      color: appScheme.white,
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: CommonAppBar(
          backIconColor: appScheme.black,
        ),
        backgroundColor: appScheme.white,
        body: const ActivityDetailScheduledJob(),
      ),
    );
  }
}
