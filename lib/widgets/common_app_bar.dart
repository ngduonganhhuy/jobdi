import 'package:flutter/material.dart'
    show AppBar, AppBarTheme, Colors, kToolbarHeight;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show REdgeInsets, SizeExtension;
import 'package:jobdi/core/services/navigation_service/navigator_service.dart'
    show NavigatorService;
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_image.dart';
import 'package:jobdi/widgets/app_svg_images.dart';
import 'package:jobdi/widgets/app_text.dart';
import 'package:jobdi/widgets/click_widget.dart' show ClickWidget;

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

/// {@template common_app_bar}
/// CommonAppBar widget.
/// {@endtemplate}
class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// {@macro common_app_bar}
  CommonAppBar({
    required this.title,
    super.key,
    this.isShowLeading = true,
    this.bottom,
    this.elevation,
    this.toolbarHeight,
    this.resultBack,
    this.onBack,
    this.actions,
  }) : assert(
         elevation == null || elevation >= 0.0,
         'Elevation must be != null and greater than 0',
       ),
       preferredSize = _PreferredAppBarSize(
         toolbarHeight,
         bottom?.preferredSize.height,
       );

  @override
  final Size preferredSize;
  final double? elevation;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final String title;
  final bool isShowLeading;
  final dynamic resultBack;
  final void Function()? onBack;
  final List<Widget>? actions;

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) +
          (preferredSize.bottomHeight ?? 0) +
          12.r;
    }
    return preferredSize.height + 12;
  }
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) => AppBar(
    elevation: widget.elevation ?? 0,
    leading: const SizedBox.shrink(),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    actions: widget.actions,
    flexibleSpace: Container(
      padding: REdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      height: double.infinity,
      child: Row(
        mainAxisAlignment: Navigator.canPop(context)
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          if (widget.isShowLeading)
            Expanded(
              child: Visibility(
                visible: Navigator.canPop(context),
                child: ClickWidget(
                  onTap:
                      widget.onBack ??
                      () => NavigatorService.goBack(context, widget.resultBack),
                  child: AppSvgImage(
                    assetName: SVGAsset.icon_arrow_left,
                    color: appScheme.white,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 4,
            child: SemiBoldText(
              widget.title,
              textAlign: TextAlign.center,
              fontSize: 18,
              maxLines: 1,
              color: appScheme.white,
            ),
          ),
          if (widget.isShowLeading)
            Expanded(
              child: Visibility(
                visible: Navigator.canPop(context),
                child: const SizedBox.shrink(),
              ),
            ),
        ],
      ),
    ),
  );
}
