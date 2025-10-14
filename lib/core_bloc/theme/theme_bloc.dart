import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_themes.dart';
import 'package:jobdi/core/utils/storage_util.dart';
import 'package:jobdi/core/utils/utils.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(PinkThemeState()) {
    on<SetInitialTheme>(
      (event, emit) async {
        final currentAppTheme = getTheme();
        await setTheme(emit, newTheme: currentAppTheme ?? AppTheme.Pink);
      },
    );

    // toggle the app theme
    on<ToggleThemeEvent>((event, emit) async {
      await setTheme(emit, newTheme: event.theme);
    });
  }

  AppTheme? getTheme() {
    final themeStorage = StorageUtil.getString(StorageKey.THEME);
    final currentTheme = Utils.stringToEnum(themeStorage, AppTheme.values);
    return currentTheme;
  }

  Future<void> setTheme(
    Emitter<ThemeState> emit, {
    required AppTheme newTheme,
  }) async {
    switch (newTheme) {
      case AppTheme.Pink:
        emit(PinkThemeState());
      case AppTheme.Green:
        emit(GreenThemeState());
    }
    await StorageUtil.putString(StorageKey.THEME, newTheme.key);
  }
}
