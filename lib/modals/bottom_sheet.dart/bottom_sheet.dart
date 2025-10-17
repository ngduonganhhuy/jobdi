import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/utils/utils.dart' show Utils;
import 'package:jobdi/widgets/app_safe_area.dart' show AppSafeArea;

abstract class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, this.maxHeight, this.autoPadding = true});
  final double? maxHeight;
  final bool autoPadding;
}

abstract class BottomSheetWidgetState<T extends BottomSheetWidget>
    extends State<T> {
  static const maxWidth = 600.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paddingHorizontal = 1.sw > maxWidth ? (1.sw - maxWidth) / 2 : 16.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: !widget.autoPadding
              ? MediaQuery.of(context).viewInsets
              : EdgeInsets.fromLTRB(
                  paddingHorizontal,
                  16,
                  paddingHorizontal,
                  16 + MediaQuery.of(context).viewInsets.bottom,
                ),
          constraints: BoxConstraints(
            maxHeight: widget.maxHeight ?? Utils.getHeightPercent(context, 70),
          ),
          child: AppSafeArea(
            color: Colors.transparent,
            child: buildContent(context),
          ),
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context);
}
