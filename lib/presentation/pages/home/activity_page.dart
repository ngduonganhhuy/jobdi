import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';
import 'package:jobdi/domain/entities/activity_entity.dart';
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/listview_with_no_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class ActivityPage extends StatefulWidget implements BasePage {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();

  @override
  String get screenName => 'ActivityPage';
}

class _ActivityPageState extends State<ActivityPage> with TickerProviderStateMixin {
  late final _tabbarController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        backgroundColor: appScheme.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appScheme.white,
          title: SemiBoldText(
            'Hoạt động',
            color: appScheme.black,
            fontSize: 18,
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              physics: const ClampingScrollPhysics(),
              isScrollable: true,
              padding: const EdgeInsets.only(left: 8),
              splashFactory: NoSplash.splashFactory,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              indicatorPadding: const EdgeInsets.only(top: 8),
              indicator: UnderlineTabIndicator(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(1),
                  bottomRight: Radius.circular(1),
                ),
                borderSide: BorderSide(
                  width: 4,
                  color: appScheme.blue500,
                ),
                insets: const EdgeInsets.symmetric(horizontal: 32),
              ),
              dividerHeight: 0,
              unselectedLabelColor: appScheme.gray300,
              labelColor: appScheme.gray900,
              labelStyle: appFont.useFont(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Gần đây nhất'),
                Tab(text: 'Việc tức thì'),
                Tab(text: 'Việc định kỳ'),
                Tab(text: 'Đã hủy'),
              ],
              controller: _tabbarController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabbarController,
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return ListViewWithNoData(
                        noDataWidget: const EmptyList(),
                        shrinkWrap: true,
                        itemCount: ActivityEntity.mockData.length,
                        separatorBuilder: (_, _) => const Gap(1),
                        itemBuilder: (ctx, i) {
                          final item = ActivityEntity.mockData[i];
                          return ItemActivity(item: item);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemActivity extends StatelessWidget {
  const ItemActivity({
    required this.item,
    super.key,
  });

  final ActivityEntity item;

  @override
  Widget build(BuildContext context) {
    final isDone = item.status == ActivityStatus.done;
    return ClickWidget(
      onTap: () {
        NavigatorService.goToActivityDetailPage(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  item.image,
                  width: 28.r,
                  height: 28.r,
                ),
                const Gap(18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SemiBoldText(
                        item.title,
                        color: appScheme.gray900,
                        fontSize: 14,
                      ),
                      RegularText(
                        item.address,
                        color: appScheme.gray500,
                        fontSize: 12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                if (isDone)
                  MediumText(
                    item.displayAmount,
                    color: appScheme.green500,
                    fontSize: 14,
                  )
                else
                  AppSvgImage(
                    assetName: SVGAsset.icon_chevron_right,
                    width: 24.r,
                    height: 24.r,
                  ),
              ],
            ),
            const Gap(12),
            Row(
              children: <Widget>[
                Opacity(
                  opacity: 0,
                  child: Image.asset(
                    item.image,
                    width: 28.r,
                    height: 28.r,
                  ),
                ),
                const Gap(18),
                if (isDone)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RegularText(
                          item.staffName,
                          color: appScheme.gray700,
                          fontSize: 14,
                        ),
                        const Gap(4),
                        Row(
                          children: <Widget>[
                            SemiBoldText(
                              'Đánh giá',
                              fontSize: 12,
                              color: appScheme.blue500,
                            ),
                            const Gap(4),
                            AppSvgImage(
                              assetName: SVGAsset.icon_arrow_right,
                              width: 16.r,
                              height: 16.r,
                              color: appScheme.blue500,
                            ),
                            const Spacer(),
                            if (item.timeFinished != null)
                              RegularText(
                                timeago.format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    item.timeFinished!,
                                  ),
                                ),
                                color: appScheme.gray400,
                                fontSize: 12,
                              ),
                          ],
                        ),
                      ],
                    ),
                  )
                else
                  item.status.statusWidget,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppSvgImage(
          assetName: SVGAsset.icon_box_search,
          width: 24.r,
          height: 24.r,
        ),
        const Gap(12),
        RegularText(
          'Không có hoạt động nào',
          fontSize: 14,
          color: appScheme.gray400,
        ),
      ],
    );
  }
}
