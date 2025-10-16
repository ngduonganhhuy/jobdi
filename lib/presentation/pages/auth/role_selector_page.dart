import 'package:flutter/material.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;

class RoleSelectorPage extends StatefulWidget implements BasePage {
  const RoleSelectorPage({super.key});

  @override
  State<RoleSelectorPage> createState() => _RoleSelectorPageState();

  @override
  String get screenName => 'RoleSelectorPage';
}

class _RoleSelectorPageState extends State<RoleSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.primaryColor,
        body: Container(),
      ),
    );
  }
}
