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
    primaryColor: const Color(0xFFF74169),
    white: Colors.white,
    black: Colors.black,
    gray200: const Color(0xFFD6D7D8),
    gray900: const Color(0xFF161617),
    gray500: const Color(0xFF737374),
  ),
  AppTheme.Green: AppColors(
    primaryColor: Colors.greenAccent,
    white: Colors.white,
    black: Colors.black,
    gray200: const Color(0xFFD6D7D8),
    gray900: const Color(0xFF161617),
    gray500: const Color(0xFF737374),
  ),
};
