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
    gray100: const Color(0xFFE9E9EC),
    gray400: const Color(0xFF8B8B8B),
    gray25: const Color(0xFFF8F8F9),
    gray300: const Color(0xFFB2B2B2),
    blue500: const Color(0xFF318AE3),
    red300: const Color(0xFFEE7777),
    red50: const Color(0xFFFFEFEF),
    red500: const Color(0xFFEE3535),
    blue400: const Color(0xFF4C98E4),
    gray700: const Color(0xFF454545),
    gray50: const Color(0xFFF4F4F4),
    gray800: const Color(0xFF2D2D2E),
    primaryColor200: const Color(0xFFFEB9C8),
    primaryColor50: const Color(0xFFFFF0F3),
    primaryColor600: const Color(0xFFC63454),
  ),
  AppTheme.Green: AppColors(
    primaryColor: Colors.greenAccent,
    white: Colors.white,
    black: Colors.black,
    gray200: const Color(0xFFD6D7D8),
    gray900: const Color(0xFF161617),
    gray500: const Color(0xFF737374),
    gray100: const Color(0xFFE9E9EC),
    gray400: const Color(0xFF8B8B8B),
    gray25: const Color(0xFFF8F8F9),
    gray300: const Color(0xFFB2B2B2),
    blue500: const Color(0xFF318AE3),
    red300: const Color(0xFFEE7777),
    red50: const Color(0xFFFFEFEF),
    red500: const Color(0xFFEE3535),
    blue400: const Color(0xFF4C98E4),
    gray700: const Color(0xFF454545),
    gray50: const Color(0xFFF4F4F4),
    gray800: const Color(0xFF2D2D2E),
    primaryColor200: const Color(0xFF98EEAC),
    primaryColor50: const Color(0xFFE7FBF5),
    primaryColor600: const Color(0xFF22AF87),
  ),
};
