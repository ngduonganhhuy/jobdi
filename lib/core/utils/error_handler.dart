import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:jobdi/core/error/exception.dart';
import 'package:jobdi/core/utils/toast_helper.dart';

class ErrorHandler {
  static void trackError(String error, StackTrace? stackTrace) {}

  static Future<void> handleAsyncError(
    Object error,
    StackTrace stackTrace,
  ) async {
    if (error is! MissingPluginException) {
      if (error is ApiException) {
        await ToastHelper.showErrorToast(
          error.error ?? ApiErrorMessage.UNKNOWN_ERROR,
        );
      } else if (error is WebSocketException) {
        await ToastHelper.showErrorToast(ApiErrorMessage.NETWORK_ERROR);
      } else {
        await ToastHelper.showErrorToast(
          kReleaseMode ? ApiErrorMessage.APP_EXCEPTION_ERROR : error.toString(),
        );
      }
    }
    if (kReleaseMode) {
      trackError(error.toString(), stackTrace);
    } else {
      debugPrint('CRASH: $error');
      debugPrint('CRASH STACKTRACE: $stackTrace');
    }
  }

  static void handleFlutterError(FlutterErrorDetails errorDetails) {
    if (kReleaseMode) trackError(errorDetails.toString(), errorDetails.stack);
    if (errorDetails.library != 'image resource service' &&
        !errorDetails.silent) {
      if (!kReleaseMode) {
        FlutterError.presentError(errorDetails);
      }
    }
  }
}
