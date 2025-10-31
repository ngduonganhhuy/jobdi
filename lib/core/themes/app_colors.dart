import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_themes.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/injection_container.dart';

AppColors get appScheme {
  final appTheme = locator<ThemeBloc>().getTheme();
  return appColorsData[appTheme] ?? appColorsData[AppTheme.Pink]!;
}

class AppColors {
  AppColors({
    required this.primaryColor,
    required this.primaryColor200,
    required this.primaryColor50,
    required this.primaryColor600,
    required this.white,
    required this.black,
    required this.gray200,
    required this.gray900,
    required this.gray500,
    required this.gray100,
    required this.gray400,
    required this.gray25,
    required this.blue500,
    required this.red300,
    required this.red50,
    required this.red500,
    required this.gray300,
    required this.blue400,
    required this.gray700,
    required this.gray50,
    required this.gray800,
    required this.blue600,
    required this.orange50,
    required this.orange600,
    required this.blue50,
    required this.green500,
    required this.primaryColor100,
    required this.orange500,
    required this.green600,
    required this.yellow50,
    required this.yellow500,
    required this.green100,
    required this.green50,
  });

  final Color primaryColor;
  final Color primaryColor50;
  final Color primaryColor100;
  final Color primaryColor200;
  final Color primaryColor600;
  final Color white;
  final Color black;
  final Color gray200;
  final Color gray900;
  final Color gray800;
  final Color gray500;
  final Color gray300;
  final Color gray100;
  final Color gray400;
  final Color gray25;
  final Color gray50;
  final Color blue500;
  final Color blue50;
  final Color blue600;
  final Color red300;
  final Color red50;
  final Color red500;
  final Color blue400;
  final Color gray700;
  final Color orange50;
  final Color orange600;
  final Color orange500;
  final Color green500;
  final Color green600;
  final Color green100;
  final Color green50;
  final Color yellow500;
  final Color yellow50;
}
