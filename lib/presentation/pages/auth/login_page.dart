import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/lang.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/common_app_bar.dart';
import 'package:jobdi/widgets/gap.dart';

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
        appBar: CommonAppBar(title: context.lang.signIn),
        backgroundColor: appScheme.primaryColor,
        body: Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: appScheme.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: <Widget>[
              const Gap(12),
              RPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SemiBoldText(
                          context.lang.signIn,
                          fontSize: 20,
                          color: appScheme.gray900,
                        ),
                        const Gap(8),
                        RegularText(
                          context.lang.descSignIn,
                          fontSize: 14,
                          color: appScheme.gray500,
                        ),
                      ],
                    ),
                    const Gap(12),
                    Image.asset(PNGAsset.touch_phone),
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
