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
import 'package:jobdi/modals/dialogs/picker/selected_country_phone_picker.dart';
import 'package:jobdi/presentation/pages/auth/login_page.dart'
    show ErrorPhoneWidget;
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/common_app_bar.dart';
import 'package:jobdi/widgets/common_checkbox.dart';
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/primary_button.dart';

class RegisterPage extends StatefulWidget implements BasePage {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  @override
  String get screenName => 'RegisterPage';
}

class _RegisterPageState extends State<RegisterPage> {
  CountryEntity _selectedCountry = CountryEntity.listCountries.first;
  bool _checked = false;

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
      child: Scaffold(
        appBar: CommonAppBar(title: 'Đăng ký'),
        backgroundColor: appScheme.primaryColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 12),
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
                                  'Đăng ký',
                                  fontSize: 20,
                                  color: appScheme.gray900,
                                ),
                                const Gap(8),
                                RegularText(
                                  'Nhập số điện thoại di động của anh/chị. SĐT được dùng cho các giao dịch tại JOBDEE!',
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
                                  AppSvgImage(assetName: _selectedCountry.icon),
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
                        text: 'Đã có tài khoản? ',
                        style: appFont.useFont(
                          color: appScheme.gray900,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Đăng nhập',
                            style: appFont.useFont(
                              color: appScheme.blue500,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                NavigatorService.goToLoginPage(
                                  context,
                                  clearStack: false,
                                  replace: true,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  CommonCheckbox(
                    onChanged: (value) {
                      setState(() {
                        _checked = value;
                      });
                    },
                    isChecked: _checked,
                  ),
                  const Gap(8),
                  RichText(
                    text: TextSpan(
                      text: 'Tôi đồng ý với ',
                      style: appFont.useFont(
                        color: appScheme.gray900,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'điều khoản sử dụng',
                          style: appFont.useFont(
                            color: appScheme.blue500,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: PrimaryButton(
                  disabled: !_checked,
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
    );
  }
}
