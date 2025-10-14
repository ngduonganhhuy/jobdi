part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState(this.appColors);
  final AppColors? appColors;

  @override
  List<Object?> get props => [appColors];
}

class PinkThemeState extends ThemeState {
  PinkThemeState() : super(appColorsData[AppTheme.Pink]);
}

class GreenThemeState extends ThemeState {
  GreenThemeState() : super(appColorsData[AppTheme.Green]);
}
