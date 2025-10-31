import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/impl/base_page.dart' show BasePage;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/core/themes/app_text_styles.dart' show appFont;
import 'package:jobdi/domain/entities/conversation_entity.dart';
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart'
    show MediumText, RegularText, SemiBoldText;
import 'package:jobdi/widgets/custom_text_field.dart';
import 'package:jobdi/widgets/gap.dart';
import 'package:jobdi/widgets/listview_with_no_data.dart';

class ConversationsPage extends StatefulWidget implements BasePage {
  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();

  @override
  String get screenName => 'ConversationsPage';
}

class _ConversationsPageState extends State<ConversationsPage> {
  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      color: appScheme.white,
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appScheme.white,
          title: SemiBoldText(
            'Tin nhắn',
            color: appScheme.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: appScheme.white,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: appScheme.black.withValues(alpha: .05),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: CustomTextField(
                fillColor: appScheme.white,
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: appScheme.gray200,
                    width: 0.5,
                  ),
                ),
                hintStyle: appFont.useFont(
                  color: appScheme.gray500,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                prefix: const AppSvgImage(
                  assetName: SVGAsset.icon_search_outline,
                  width: 24,
                  height: 24,
                ),
                hintText: 'Tìm theo tên thợ',
              ),
            ),
            Expanded(
              child: ListViewWithNoData(
                itemCount: mockConversations.length,
                shrinkWrap: true,
                separatorBuilder: (_, _) => const Gap(1),
                itemBuilder: (context, index) {
                  final itemConversation = mockConversations[index];
                  return ItemConversation(itemConversation: itemConversation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemConversation extends StatelessWidget {
  const ItemConversation({
    required this.itemConversation,
    super.key,
  });

  final ConversationEntity itemConversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Avatar
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  itemConversation.staff.image,
                ),
              ),
              Positioned(
                bottom: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                    color: appScheme.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: <Widget>[
                      AppSvgImage(
                        assetName: SVGAsset.icon_star,
                        width: 10.r,
                        height: 10.r,
                        fit: BoxFit.cover,
                      ),
                      const Gap(2),
                      MediumText(
                        itemConversation.staff.rating.toString(),
                        color: appScheme.gray700,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RegularText(
                        itemConversation.staff.name,
                        color: appScheme.gray900,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(10),
                    RegularText(
                      itemConversation.staff.workingStatus.label,
                      color: itemConversation.staff.workingStatus.color,
                      fontSize: 12,
                    ),
                  ],
                ),
                const Gap(2),
                RegularText(
                  itemConversation.message,
                  fontSize: 12,
                  color: appScheme.gray500,
                ),
                const Gap(8),
                itemConversation.staffStatus.statusWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
