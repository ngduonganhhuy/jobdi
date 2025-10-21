import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/domain/entities/country_entity.dart';
import 'package:jobdi/lang.dart';
import 'package:jobdi/modals/dialogs/picker/selected_country_phone_picker.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/common_app_bar.dart';
import 'package:jobdi/widgets/common_background.dart' show CommonBackground;
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart';

class LoginPage extends StatefulWidget implements BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  String get screenName => 'LoginPage';
}

class _LoginPageState extends State<LoginPage> {
  CountryEntity _selectedCountry = CountryEntity.listCountries.first;

  void _onOpenCountryPhonePicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => SelectedCountryPhonePicker(
        initialCountry: _selectedCountry,
        onChange: (value) {
          setState(() {
            _selectedCountry = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: CommonBackground(
        child: Scaffold(
          appBar: CommonAppBar(title: context.lang.signIn),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: appScheme.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Gap(12),
                      RPadding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
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
                            ),
                            const Gap(12),
                            Image.asset(PNGAsset.touch_phone),
                          ],
                        ),
                      ),
                      const Gap(28),
                      Row(
                        children: [
                          Flexible(
                            child: ClickWidget(
                              onTap: _onOpenCountryPhonePicker,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: appScheme.gray100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    AppSvgImage(
                                      assetName: _selectedCountry.icon,
                                    ),
                                    const Gap(10),
                                    RegularText(
                                      _selectedCountry.code,
                                      color: appScheme.gray400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Gap(12),
                          const Expanded(
                            flex: 2,
                            child: CustomTextField(
                              hintText: 'Số điện thoại',
                            ),
                          ),
                        ],
                      ),
                      const ErrorPhoneWidget(),
                      const Gap(20),
                      RichText(
                        text: TextSpan(
                          text: 'Chưa có tài khoản? ',
                          style: appFont.useFont(
                            color: appScheme.gray900,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Đăng ký',
                              style: appFont.useFont(
                                color: appScheme.blue500,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  NavigatorService.goToRegisterPage(context);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: PrimaryButton(
                    onTap: () {
                      NavigatorService.goToOTPPage(context);
                    },
                    label: 'Đăng nhập',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorPhoneWidget extends StatelessWidget {
  const ErrorPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: appScheme.red50,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: <Widget>[
          const AppSvgImage(assetName: SVGAsset.error),
          const Gap(8),
          Flexible(
            child: RegularText(
              'Không nhận dạng được số điện thoại. Vui lòng thử lại',
              color: appScheme.gray900,
            ),
          ),
        ],
      ),
    );
  }
}
