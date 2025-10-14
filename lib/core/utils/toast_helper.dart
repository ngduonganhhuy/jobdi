import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jobdi/core/extensions/widget_extension.dart';

class ToastHelper {
  static Future<void> showToast(String msg, {Alignment? alignment}) async {
    await SmartDialog.showToast(
      msg,
      alignment: alignment,
      debounce: true,
      displayType: SmartToastType.last,
    );
  }

  static Future<void> showSuccessToast(String msg) async {
    await showCustomToast(
      alignment: Alignment.topCenter,
    );
  }

  static Future<void> showErrorToast(
    String msg, {
    Alignment? alignment,
  }) async {
    await showCustomToast(
      alignment: alignment ?? Alignment.bottomCenter,
    );
  }

  static Future<void> showCustomToast({
    Widget? customToast,
    Alignment? alignment,
    Duration? displayTime,
    void Function()? onClickToast,
  }) async {
    await SmartDialog.showToast(
      displayTime: displayTime,
      '',
      alignment: alignment,
      debounce: true,
      clickMaskDismiss: true,
      consumeEvent: true,
      builder: (context) =>
          customToast?.clickable(
            onClickToast != null
                ? () async {
                    await SmartDialog.dismiss<void>(status: SmartStatus.toast);
                    onClickToast.call();
                  }
                : null,
          ) ??
          const SizedBox(),
    );
  }
}
