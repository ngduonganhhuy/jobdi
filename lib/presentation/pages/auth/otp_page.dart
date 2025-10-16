// ignore_for_file: constant_identifier_names, document_ignores

import 'dart:async' show Timer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocListener;
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show RPadding, SizeExtension;
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart' show PNGAsset;
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/dialogs/alert_dialog/alert_limited_otp.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/presentation/bloc/auth/auth_bloc.dart';
import 'package:jobdi/presentation/bloc/auth/auth_event.dart';
import 'package:jobdi/presentation/bloc/auth/auth_state.dart'
    show AuthState, AuthStatePatterns;
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_text.dart' show SemiBoldText;
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/common_app_bar.dart' show CommonAppBar;
import 'package:jobdi/widgets/gap.dart' show Gap;
import 'package:pinput/pinput.dart'
    show HapticFeedbackType, PinTheme, Pinput, SmsRetriever;
import 'package:smart_auth/smart_auth.dart' show SmartAuth;

const int MAX_OTP_ATTEMPT = 5;

class OTPPage extends StatefulWidget implements BasePage {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();

  @override
  String get screenName => 'OTPPage';
}

class _OTPPageState extends State<OTPPage> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  late final AuthBloc _authBloc = locator<AuthBloc>();

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(SmartAuth.instance);
    _authBloc.add(const AuthEvent.checkShowNotificationIfNeeded());
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        state.whenOrNull(
          showNotificationNoticed: (_, _) {
            showCupertinoDialog<void>(
              context: context,
              builder: (context) {
                return AlertLimitedOtp(
                  authBloc: _authBloc,
                );
              },
            ).whenComplete(() => NavigatorService.goBack<void>(context));
          },
        );
      },
      child: AppSafeArea(
        child: Scaffold(
          appBar: CommonAppBar(title: 'OTP'),
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
              children: <Widget>[
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
                              'Nhập OTP',
                              fontSize: 20,
                              color: appScheme.gray900,
                            ),
                            const Gap(8),
                            RichText(
                              text: TextSpan(
                                text: 'Mã OTP đã được gửi đến \n',
                                style: appFont.useFont(
                                  color: appScheme.gray500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: '+84 1234 567 928. ',
                                    style: appFont.useFont(
                                      color: appScheme.gray900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Đổi số điện thoại',
                                    style: appFont.useFont(
                                      color: appScheme.blue400,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      Image.asset(PNGAsset.touch_phone),
                    ],
                  ),
                ),
                _pinInput,
                const Gap(12),
                CooldownTimer(
                  onResend: () {},
                  initialSeconds: 90,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _pinInput {
    final defaultPinTheme = PinTheme(
      width: 48.r,
      height: 48.r,
      textStyle: appFont.useFont(
        color: appScheme.gray900,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        color: appScheme.gray25,
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        return RPadding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              enableInteractiveSelection: true,
              smsRetriever: smsRetriever,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const Gap(12),
              validator: (value) {
                if (value != '222222') {
                  _authBloc.add(const AuthEvent.otpValidatorFailed());
                }
                return value == '222222' ? null : 'Pin is incorrect';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {},
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: appScheme.blue500),
                  color: appScheme.white,
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: appScheme.red500),
                  color: appScheme.white,
                ),
              ),
              errorBuilder: (errorText, pin) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Mã OTP không hợp lệ. Số lần nhập còn lại: ',
                        style: appFont.useFont(
                          color: appScheme.red500,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: '0${state.retryRemaining}',
                            style: appFont.useFont(
                              color: appScheme.red500,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CooldownTimer extends StatefulWidget {
  const CooldownTimer({
    required this.onResend,
    super.key,
    this.initialSeconds = 30,
  });

  final int initialSeconds;
  final VoidCallback onResend;

  @override
  State<CooldownTimer> createState() => _CooldownTimerState();
}

class _CooldownTimerState extends State<CooldownTimer> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCooldown();
  }

  void _startCooldown() {
    _timer?.cancel();
    _remaining = widget.initialSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining == 0) {
        timer.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  void _onTapResend() {
    if (_remaining > 0) return;
    widget.onResend();
    _startCooldown();
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isActive = _remaining == 0;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isActive
          ? ClickWidget(
              onTap: _onTapResend,
              child: Text(
                'Gửi lại mã OTP',
                style: appFont.useFont(
                  color: appScheme.blue500,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : RichText(
              text: TextSpan(
                text: 'Gửi lại mã OTP sau ',
                style: appFont.useFont(
                  color: appScheme.gray500,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: _formatTime(_remaining),
                    style: appFont.useFont(
                      color: appScheme.gray500,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsRetrieverApiListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final res = await smartAuth.getSmsWithUserConsentApi();
    if (res.hasData) {
      return res.data!.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
