import 'dart:io';

import 'package:jobdi/core/services/navigation_service/navigator_service.dart';
import 'package:jobdi/core/utils/injection.dart' show Injection;
import 'package:jobdi/modals/dialogs/confirm_dialog.dart' show ConfirmDialog;
import 'package:jobdi/modals/modal_helper.dart' show ModalHelper;
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static const requestPhotoPermissionMessage =
      'LendMe cần bạn cấp quyền truy cập vào Thư Viện để tiếp tục';
  static const requestCameraPermissionMessage =
      'LendMe cần bạn cấp quyền truy cập Máy Ảnh để tiếp tục';

  static Future<void> handleNotHavePermission({
    required PermissionStatus permissionStatus,
    required String message,
  }) async {
    if (permissionStatus == PermissionStatus.permanentlyDenied ||
        permissionStatus == PermissionStatus.denied) {
      await ModalHelper.showCustomDialog<void>(
        context: Injection.navKey.currentContext!,
        dialog: ConfirmDialog(
          title: 'Xác nhận',
          message: message,
          useLoading: true,
          onConfirm: (ctx) => openAppSettings().then(
            (value) => NavigatorService.goBack<void>(ctx),
          ),
        ),
      );
    }
  }

  static Future<void> retryCameraPermission() async {
    final status = await Permission.camera.request();
    await handleNotHavePermission(
      permissionStatus: status,
      message: requestCameraPermissionMessage,
    );
  }

  static Future<void> retryPhotoPermission() async {
    if (Platform.isIOS) {
      final status = await Permission.photos.request();
      await handleNotHavePermission(
        permissionStatus: status,
        message: requestPhotoPermissionMessage,
      );
    }
  }
}
