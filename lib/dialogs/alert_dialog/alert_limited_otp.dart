import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/presentation/bloc/auth/auth_bloc.dart';
import 'package:jobdi/presentation/bloc/auth/auth_state.dart' show AuthState;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/gap.dart';

class AlertLimitedOtp extends StatelessWidget {
  const AlertLimitedOtp({required this.authBloc, super.key});
  final AuthBloc authBloc;

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: appScheme.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(4),
                    child: AppSvgImage(
                      assetName: SVGAsset.notification,
                    ),
                  ),
                  const Gap(20),
                  const SemiBoldText(
                    'Thông báo',
                    fontSize: 16,
                  ),
                  const Gap(20),
                  BlocBuilder<AuthBloc, AuthState>(
                    bloc: authBloc,
                    builder: (context, state) {
                      return RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'Anh/Chị đã nhập quá số lần cho phép.\n Vui lòng thử lại sau: ',
                          style: appFont.useFont(
                            color: appScheme.gray700,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: _formatTime(
                                state.secondRemainingToWait ?? 0,
                              ),
                              style: appFont.useFont(
                                color: appScheme.gray700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                  ClickWidget(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: appScheme.gray50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const AppSvgImage(
                            assetName: SVGAsset.icon_phone,
                          ),
                          const Gap(8),
                          SemiBoldText(
                            'Liên hệ',
                            fontSize: 14,
                            color: appScheme.gray900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ClickWidget(
                onTap: () {
                  NavigatorService.goBack<void>(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: AppSvgImage(
                    assetName: SVGAsset.icon_close,
                    color: appScheme.gray900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
