import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/utils/map_launcher.dart';
import 'package:jobdi/core/utils/url_utils.dart';
import 'package:jobdi/core/utils/utils.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart' show AppBloc;
import 'package:jobdi/domain/entities/activity_detail_entity.dart' show mockActivityDetail;
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/presentation/pages/activity/widgets/activity_schedule_box.dart';
import 'package:jobdi/presentation/pages/activity/widgets/stat_work_item.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart' show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart' show Gap;

class ActivityDetailScheduledJob extends StatefulWidget {
  const ActivityDetailScheduledJob({super.key});

  @override
  State<ActivityDetailScheduledJob> createState() => _ActivityDetailScheduledJobState();
}

class _ActivityDetailScheduledJobState extends State<ActivityDetailScheduledJob> {
  late final AppBloc _appBloc = locator<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(16),
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
              if (!_appBloc.isClient) ...[
                const Gap(12),
                const ActivityScheduleBox(),
              ],
              const Gap(22),
              StatWorkItem(
                label: 'Địa chỉ sửa',
                value: mockActivityDetail.work.address,
                icon: _appBloc.isClient ? SVGAsset.icon_location_client : SVGAsset.icon_location_staff,
                children: [
                  if (!_appBloc.isClient)
                    ClickWidget(
                      onTap: () {
                        MapsLauncher.launchQuery(mockActivityDetail.work.address);
                      },
                      child: MediumText(
                        'Bản đồ',
                        color: appScheme.blue500,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
              const Gap(20),
              StatWorkItem(
                label: _appBloc.isClient ? 'Thợ thực hiện' : 'Khách hàng',
                value: mockActivityDetail.work.staff.name,
                icon: _appBloc.isClient ? SVGAsset.icon_user_square_client : SVGAsset.icon_user_square_staff,
                children: [
                  if (!_appBloc.isClient) ...[
                    _IconStat(
                      icon: SVGAsset.icon_phone_outline,
                      onTap: () {
                        UrlUtils.makePhoneCall(mockActivityDetail.work.staff.phone);
                      },
                    ),
                    const Gap(12),
                    _IconStat(
                      icon: SVGAsset.icon_message_outline,
                      onTap: () {},
                    ),
                  ],
                ],
              ),
              if (_appBloc.isClient) ...[
                const Gap(20),
                StatWorkItem(
                  label: 'Giá đã chốt',
                  value: '${Utils.formatNumber(mockActivityDetail.work.lastPrice)} / 1 buổi',
                  icon: SVGAsset.icon_first_price_client,
                ),
              ],

              if (_appBloc.isClient) ...[
                const Gap(12),
                const ActivityScheduleBox(
                  isShowTitle: false,
                ),
              ],
              const Gap(20),
              Row(
                children: <Widget>[
                  SemiBoldText(
                    'Mô tả vấn đề',
                    color: appScheme.blue500,
                    fontSize: 14,
                  ),
                  const Gap(8),
                  AppSvgImage(
                    assetName: SVGAsset.icon_arrow_down,
                    width: 24.r,
                    height: 24.r,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 64,
          thickness: 8,
          color: appScheme.gray25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MediumText(
                'Đã làm ${mockActivityDetail.scheduleWork.totalSessionsDone}/${mockActivityDetail.scheduleWork.totalSessions} buổi',
                fontSize: 16,
                color: appScheme.gray900,
              ),
              const Gap(12),
              StaggeredGrid.count(
                crossAxisCount: 5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  ...List.generate(
                    mockActivityDetail.scheduleWork.totalSessions,
                    (index) {
                      final isCurrent = index == mockActivityDetail.scheduleWork.currentSession;
                      final isDone = index <= mockActivityDetail.scheduleWork.totalSessionsDone;
                      return Container(
                        decoration: BoxDecoration(
                          color: isCurrent ? appScheme.white : appScheme.gray25,
                          borderRadius: BorderRadius.circular(10),
                          border: isCurrent
                              ? Border.all(
                                  color: appScheme.blue500,
                                  width: 0.5,
                                )
                              : null,
                        ),
                        child: Column(
                          children: <Widget>[
                            const Gap(10),
                            if (isDone)
                              AppSvgImage(
                                assetName: SVGAsset.icon_check_square,
                                width: 20.r,
                                height: 20.r,
                              )
                            else
                              Container(
                                decoration: BoxDecoration(
                                  color: appScheme.gray100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                width: 20.r,
                                height: 20.r,
                              ),
                            const Gap(10),
                            MediumText('Buổi ${index + 1}', fontSize: 12, color: isDone ? appScheme.gray300 : appScheme.gray900),
                            const Gap(10),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconStat extends StatelessWidget {
  const _IconStat({
    required this.icon,
    required this.onTap,
  });
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickWidget(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: appScheme.gray50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AppSvgImage(
          assetName: icon,
          width: 24.r,
          height: 24.r,
        ),
      ),
    );
  }
}
