import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobdi/core/themes/app_themes.dart';
import 'package:jobdi/core/utils/injection.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';

AppColors get appScheme {
  final appTheme = BlocProvider.of<ThemeBloc>(
    Injection.navKey.currentContext!,
  ).getTheme();
  return appColorsData[appTheme] ?? appColorsData[AppTheme.Pink]!;
}

class AppColors {
  AppColors({
    required this.primaryColor,
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
  });

  final Color primaryColor;
  final Color white;
  final Color black;
  final Color gray200;
  final Color gray900;
  final Color gray500;
  final Color gray300;
  final Color gray100;
  final Color gray400;
  final Color gray25;
  final Color gray50;
  final Color blue500;
  final Color red300;
  final Color red50;
  final Color red500;
  final Color blue400;
  final Color gray700;
}
