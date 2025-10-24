import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show RPadding;
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_text_styles.dart' show appFont;
import 'package:jobdi/presentation/pages/home/widgets/category_grid.dart';
import 'package:jobdi/presentation/pages/home/widgets/programs_section.dart';
import 'package:jobdi/presentation/pages/home/widgets/search_box.dart';
import 'package:jobdi/widgets/app_text.dart' show MediumText, SemiBoldText;
import 'package:jobdi/widgets/gap.dart' show Gap;

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({
    super.key,
  });

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const Gap(12),
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                SemiBoldText(
                  '👋',
                  fontSize: 24,
                  color: appScheme.gray900,
                ),
                const Gap(16),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Xin chào,\n',
                      style: appFont.useFont(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: appScheme.gray400,
                      ),
                      children: [
                        TextSpan(
                          text: '140 thợ ',
                          style: appFont.useFont(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: appScheme.blue500,
                          ),
                        ),
                        TextSpan(
                          text: 'đang sẵn sàng phục vụ bạn!',
                          style: appFont.useFont(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: appScheme.gray700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Gap(24),

          const SearchBox(),

          const Gap(25),

          const ProgramsSection(),

          const Gap(24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MediumText(
              'Tìm thợ',
              fontSize: 16,
              color: appScheme.gray900,
            ),
          ),

          const Gap(24),

          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CategoryGrid(),
          ),
        ],
      ),
    );
  }
}
