import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/themes/app_colors.dart' show appScheme;
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart' show SemiBoldText;
import 'package:jobdi/widgets/click_widget.dart';
import 'package:jobdi/widgets/gap.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    required this.onToggle,
    super.key,
    this.isOn = true,
  });

  final bool isOn;
  final void Function(bool value) onToggle;

  @override
  Widget build(BuildContext context) => ClickWidget(
    onTap: () => onToggle(!isOn),
    child: Container(
      decoration: BoxDecoration(
        color: appScheme.white,
        borderRadius: BorderRadius.circular(750),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          if (!isOn) ...[
            const Gap(4),
            SemiBoldText(
              'Tắt',
              fontSize: 15,
              color: appScheme.primaryColor100,
              lineheight: 21,
            ),
            const Gap(9),
          ],
          RSizedBox(
            width: 30,
            height: 30,
            child: AppSvgImage(
              assetName: SVGAsset.icon_shutdown,
              width: 30.r,
              height: 30.r,
              fit: BoxFit.cover,
            ),
          ),
          if (isOn) ...[
            const Gap(9),
            SemiBoldText(
              'Bật',
              fontSize: 15,
              color: appScheme.primaryColor100,
              lineheight: 21,
            ),
            const Gap(4),
          ],
        ],
      ),
    ),
  );
}
