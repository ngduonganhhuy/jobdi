import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/env/env.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart' show SVGAsset;
import 'package:jobdi/core/utils/time_formatter.dart';
import 'package:jobdi/core/utils/url_utils.dart';
import 'package:jobdi/core/utils/utils.dart' show Utils;
import 'package:jobdi/core_bloc/app/app_bloc.dart' show AppBloc;
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/injection_container.dart' show locator;
import 'package:jobdi/presentation/pages/activity/widgets/staff_feature_button.dart';
import 'package:jobdi/presentation/pages/activity/widgets/staff_info_section.dart';
import 'package:jobdi/presentation/pages/activity/widgets/stat_work_item.dart';
import 'package:jobdi/presentation/pages/activity/widgets/timeline_widget.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart' show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/gap.dart';

class ActivityDetailRealTimeJob extends StatefulWidget {
  const ActivityDetailRealTimeJob({super.key});

  @override
  State<ActivityDetailRealTimeJob> createState() => _ActivityDetailRealTimeJobState();
}

class _ActivityDetailRealTimeJobState extends State<ActivityDetailRealTimeJob> {
  late final AppBloc _appBloc = locator<AppBloc>();
  late final ValueNotifier<Duration> _elapsedNotifier;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _elapsedNotifier = ValueNotifier(_calcElapsed());
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsedNotifier.value = _calcElapsed();
    });
  }

  Duration _calcElapsed() {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    final elapsedSeconds = now - mockActivityDetail.timeStarted;
    return Duration(seconds: elapsedSeconds);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _elapsedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SemiBoldText(
                      mockActivityDetail.status.label,
                      color: appScheme.gray900,
                      fontSize: 16,
                    ),
                    const Gap(4),
                    if (mockActivityDetail.status == AcitivityDetailStatus.working)
                      ValueListenableBuilder(
                        valueListenable: _elapsedNotifier,
                        builder: (context, value, child) {
                          return SemiBoldText(
                            TimeFormatter.formatElapsedTime(value.inSeconds),
                            color: appScheme.orange500,
                            fontSize: 14,
                          );
                        },
                      ),
                  ],
                ),
                const Spacer(),
                const Gap(12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appScheme.orange50,
                    shape: BoxShape.circle,
                  ),
                  child: AppSvgImage(
                    assetName: mockActivityDetail.status.icon,
                    width: 40.r,
                    height: 40.r,
                  ),
                ),
              ],
            ),
            const Gap(24),
            const ActivityTimelineWidget(),
            const Gap(12),
            Row(
              children: <Widget>[
                SemiBoldText(
                  mockActivityDetail.title,
                  color: appScheme.gray900,
                  fontSize: 18,
                ),
                const Gap(10),
                mockActivityDetail.work.status.statusWidget,
              ],
            ),
            const Gap(4),
            RegularText(
              'Mã đơn: #${mockActivityDetail.work.id}',
              color: appScheme.gray400,
              fontSize: 14,
            ),
            StatWorkItem(
              label: 'Địa chỉ sửa',
              value: mockActivityDetail.work.address,
              icon: _appBloc.isClient ? SVGAsset.icon_location_client : SVGAsset.icon_location_staff,
            ),
            StatWorkItem(
              label: 'Thợ thực hiện',
              value: mockActivityDetail.work.staff.name,
              icon: _appBloc.isClient ? SVGAsset.icon_user_square_client : SVGAsset.icon_user_square_staff,
            ),
            StatWorkItem(
              label: 'Phương thức thanh toán',
              value: mockActivityDetail.paymentGate.label,
              icon: _appBloc.isClient ? SVGAsset.icon_wallet_client : SVGAsset.icon_wallet_staff,
            ),
            StatWorkItem(
              label: 'Giá ban đầu',
              value: '${Utils.formatNumber(mockActivityDetail.work.firstPrice)}đ',
              icon: _appBloc.isClient ? SVGAsset.icon_first_price_client : SVGAsset.icon_first_price_staff,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appScheme.yellow50,
                border: Border.all(width: 0.5, color: appScheme.yellow500),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: <Widget>[
                  AppSvgImage(
                    assetName: SVGAsset.icon_money_send,
                    width: 24.r,
                    height: 24.r,
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RegularText(
                        'Giá cuối cùng',
                        color: appScheme.gray400,
                        fontSize: 14,
                      ),
                      MediumText(
                        '${Utils.formatNumber(mockActivityDetail.work.lastPrice)}đ',
                        color: appScheme.gray900,
                        fontSize: 14,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: appScheme.white,
              boxShadow: [
                BoxShadow(
                  color: appScheme.black.withValues(alpha: .05),
                  offset: const Offset(0, -4),
                  blurRadius: 4,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                StaffInfoSection(
                  activityDetail: mockActivityDetail,
                  formattedJobs: TimeFormatter.formatJobList(
                    mockActivityDetail.work.staff.works,
                  ),
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StaffFeatureButton(
                      icon: SVGAsset.icon_phone_outline,
                      label: 'Gọi thợ',
                      onTap: () {
                        UrlUtils.makePhoneCall(
                          mockActivityDetail.work.staff.phone,
                        );
                      },
                    ),
                    StaffFeatureButton(
                      icon: SVGAsset.icon_message_outline,
                      label: 'Nhắn tin',
                      onTap: () {},
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    StaffFeatureButton(
                      icon: SVGAsset.icon_headphone_outline,
                      label: 'Hỗ trợ',
                      onTap: () {
                        UrlUtils.makePhoneCall(Env.hotline);
                      },
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
