import 'package:flutter/material.dart';
import 'package:jobdi/core/services/api_service/api_service.dart';
import 'package:jobdi/core/utils/storage_util.dart';

class LogoutHelper {
  static Future<void> handleLogout({BuildContext? context}) async {
    await StorageUtil.delete(StorageKey.USER_TOKEN);
    ApiService.clearToken();
  }

  static Future<void> doLogout(BuildContext? context) async {}
}
