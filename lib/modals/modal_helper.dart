import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/modals/bottom_sheet.dart/bottom_sheet.dart'
    show BottomSheetWidget;

class ModalHelper {
  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required BottomSheetWidget bottomSheet,
  }) async {
    const minHeight = 150.0;
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
        maxHeight: 1.sh - kToolbarHeight,
      ),
      builder: (BuildContext builder) => Container(
        decoration: BoxDecoration(
          color: appScheme.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: bottomSheet,
      ),
    );
  }

  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required Widget dialog,
    bool useSmartDialog = false,
    bool barrierDismissible = true,
  }) async {
    if (useSmartDialog) {
      return SmartDialog.show(
        builder: (c) => dialog,
        animationType: SmartAnimationType.centerFade_otherSlide,
      );
    } else {
      return showCupertinoDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext builder) => dialog,
      );
    }
  }
}
