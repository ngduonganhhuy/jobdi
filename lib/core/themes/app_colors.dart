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
  });

  final Color primaryColor;
  final Color white;
  final Color black;
  final Color gray200;
}
