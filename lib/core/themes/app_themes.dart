// ignore_for_file: constant_identifier_names, document_ignores

import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart';

enum AppTheme {
  Pink,
  Green;

  String get key => switch (this) {
    Pink => 'Pink',
    Green => 'Green',
  };
}

final Map<AppTheme, AppColors> appColorsData = {
  AppTheme.Pink: AppColors(
    primaryColor: Colors.pinkAccent,
    white: Colors.white,
  ),
  AppTheme.Green: AppColors(
    primaryColor: Colors.greenAccent,
    white: Colors.white,
  ),
};
