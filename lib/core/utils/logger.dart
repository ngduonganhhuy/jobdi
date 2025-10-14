import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final logger = Logger(
    printer: PrettyPrinter(
      colors: Platform.isAndroid,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      levelEmojis: {
        Level.debug: '🧐',
      },
    ),
  );

  //[Debug]
  static void d(dynamic message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  //[Info]
  static void i(dynamic message) {
    if (kDebugMode) {
      logger.i(message);
    }
  }

  //[Trace]
  static void t(dynamic message) {
    if (kDebugMode) {
      logger.t(message);
    }
  }

  //[Error]
  static void e(dynamic message) {
    if (kDebugMode) {
      logger.e(message);
    }
  }

  //[Warning]
  static void w(dynamic message) {
    if (kDebugMode) {
      logger.w(message);
    }
  }

  //[Fatal]
  static void f(dynamic message) {
    if (kDebugMode) {
      logger.f(message);
    }
  }
}
