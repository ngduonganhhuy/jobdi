import 'package:flutter/material.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;

class LoginPage extends StatefulWidget implements BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  String get screenName => 'LoginPage';
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.primaryColor,
        body: Container(
          decoration: BoxDecoration(
            color: appScheme.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
