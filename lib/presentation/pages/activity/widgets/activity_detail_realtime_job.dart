import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/env/env.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart' show SVGAsset;
import 'package:jobdi/core/utils/url_utils.dart';
import 'package:jobdi/core/utils/utils.dart' show Utils;
import 'package:jobdi/domain/entities/activity_detail_entity.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart'
    show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/gap.dart';
import 'package:timelines_plus/timelines_plus.dart'
    show FixedTimeline, TimelineTileBuilder;

class ActivityDetailRealTimeJob extends StatefulWidget {
  const ActivityDetailRealTimeJob({super.key});

  @override
  State<ActivityDetailRealTimeJob> createState() =>
      _ActivityDetailRealTimeJobState();
}

class _ActivityDetailRealTimeJobState extends State<ActivityDetailRealTimeJob> {
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

  String formatTime(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    return '$hours Giờ $minutes Phút $seconds Giây';
  }

  String formatJobList(List<String> jobs) {
    if (jobs.length <= 2) {
      return jobs.join(', ');
    } else {
      final remaining = jobs.length - 2;
      return '${jobs.take(2).join(', ')}, +$remaining';
    }
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
                    if (mockActivityDetail.status ==
                        AcitivityDetailStatus.working)
                      ValueListenableBuilder(
                        valueListenable: _elapsedNotifier,
                        builder: (context, value, child) {
                          return SemiBoldText(
                            formatTime(value.inSeconds),
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
            const _TimelineWidget(),
            const Gap(12),
            Row(
              children: <Widget>[
                SemiBoldText(
                  mockActivityDetail.work.title,
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
            _buildStatWork(
              'Địa chỉ sửa',
              mockActivityDetail.work.address,
              SVGAsset.icon_location_staff,
            ),
            _buildStatWork(
              'Thợ thực hiện',
              mockActivityDetail.work.staff.name,
              SVGAsset.icon_user_square_staff,
            ),
            _buildStatWork(
              'Phương thức thanh toán',
              mockActivityDetail.paymentGate.label,
              SVGAsset.icon_wallet_staff,
            ),
            _buildStatWork(
              'Giá ban đầu',
              '${Utils.formatNumber(mockActivityDetail.work.firstPrice)}đ',
              SVGAsset.icon_first_price_staff,
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: AppNetWorkImage(
                          url: mockActivityDetail.work.staff.image,
                          width: 40.r,
                          height: 40.r,
                        ),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SemiBoldText(
                                mockActivityDetail.work.staff.name,
                                fontSize: 14,
                                color: appScheme.gray900,
                              ),
                              const Gap(16),
                              RegularText(
                                mockActivityDetail.work.staff.rating.toString(),
                                color: appScheme.black,
                                fontSize: 14,
                              ),
                              const Gap(4),
                              SizedBox(
                                width: 24.r,
                                height: 24.r,
                                child: AppSvgImage(
                                  assetName: SVGAsset.icon_star,
                                  width: 24.r,
                                  height: 24.r,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                          const Gap(2),
                          RegularText(
                            'Thợ ${formatJobList(
                              mockActivityDetail.work.staff.works,
                            )}',
                            fontSize: 12,
                            color: appScheme.gray500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildFeatureStaff(
                      SVGAsset.icon_phone_outline,
                      'Gọi thợ',
                      onTap: () {
                        UrlUtils.makePhoneCall(
                          mockActivityDetail.work.staff.phone,
                        );
                      },
                    ),
                    _buildFeatureStaff(
                      SVGAsset.icon_message_outline,
                      'Nhắn tin',
                      onTap: () {},
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    _buildFeatureStaff(
                      SVGAsset.icon_headphone_outline,
                      'Hỗ trợ',
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

  Widget _buildFeatureStaff(
    String icon,
    String label, {
    required VoidCallback onTap,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return Expanded(
      child: ClickWidget(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            AppSvgImage(
              assetName: icon,
              width: 24.r,
              height: 24.r,
            ),
            const Gap(8),
            MediumText(
              label,
              color: appScheme.gray900,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatWork(String label, String value, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          AppSvgImage(
            assetName: icon,
            width: 24.r,
            height: 24.r,
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RegularText(
                  label,
                  color: appScheme.gray400,
                  fontSize: 14,
                ),
                MediumText(
                  value,
                  color: appScheme.gray900,
                  fontSize: 14,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineWidget extends StatelessWidget {
  const _TimelineWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RSizedBox(
        height: 50,
        child: FixedTimeline.tileBuilder(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          builder: TimelineTileBuilder.connected(
            nodePositionBuilder: (context, index) => 0,
            indicatorPositionBuilder: (context, index) => 0,
            contentsBuilder: (context, index) {
              final itemStep = AcitivityDetailStatus.values[index];
              final itemShowLineProgress =
                  AcitivityDetailStatus.values.length - 2;
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: index == itemShowLineProgress + 1
                          ? appScheme.gray200
                          : appScheme.green600,
                      shape: BoxShape.circle,
                    ),
                    child: AppSvgImage(
                      assetName: itemStep.iconTimeline,
                      width: 16.r,
                      height: 16.r,
                      color: appScheme.white,
                    ),
                  ),
                  if (index <= itemShowLineProgress)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: (1.sw - 8.r - 32.r - (20.r * 5)) / 5,
                      height: 2,
                      decoration: BoxDecoration(
                        color: appScheme.green600,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: index == itemShowLineProgress
                          ? LinearProgressIndicator(
                              minHeight: 2,
                              color: appScheme.green600,
                              backgroundColor: appScheme.green100,
                            )
                          : const SizedBox(),
                    ),
                ],
              );
            },
            itemCount: AcitivityDetailStatus.values.length,
          ),
        ),
      ),
    );
  }
}
