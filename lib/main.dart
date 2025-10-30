import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobdi/core/extensions/widget_extension.dart';
import 'package:jobdi/core/utils/error_handler.dart';
import 'package:jobdi/core/utils/storage_util.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/root/app/root.dart';
import 'package:jobdi/root/bootstrap.dart';

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
    await  StorageUtil.initPreferences();
      registerErrorHandlers();
      setupLocator();

      await bootstrap(() => const Root());
    },
    ErrorHandler.handleAsyncError,
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = ErrorHandler.handleFlutterError;
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Jobdi sorry: 😡😡'),
      ),
      body: Text(details.toString()).center,
    );
  };
}
