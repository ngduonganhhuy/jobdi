import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jobdi/core/constants/constants.dart';
import 'package:jobdi/core/utils/injection.dart';
import 'package:jobdi/core/utils/storage_util.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/l10n/app_localizations.dart' show AppLocalizations;
import 'package:jobdi/presentation/pages/auth/input_information_page.dart';
import 'package:jobdi/presentation/pages/onboarding/onboarding_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirstLaunch = false;

  @override
  void initState() {
    _initFirstLaunch();
    _initRole();
    super.initState();
  }

  void _initFirstLaunch() {
    _isFirstLaunch = StorageUtil.getBool(StorageKey.FIRST_LAUNCH) ?? true;
    if (_isFirstLaunch) {
      StorageUtil.putBool(StorageKey.FIRST_LAUNCH, data: false);
    }
  }

  void _initRole() {
    locator<AppBloc>().add(const AppEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //TODO replace screen size to default
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: Injection.navKey,
              scaffoldMessengerKey: Injection.scaffoldMessengerKey,
              theme: ThemeData(
                primaryColor: state.appColors?.primaryColor,
                fontFamily: Constants.fontFamilyName,
                checkboxTheme: CheckboxThemeData(
                  checkColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return state.appColors?.blue500;
                    }
                    return state.appColors?.gray100;
                  }),
                ),
              ),
              navigatorObservers: [
                Injection.appRouteObserver,
                FlutterSmartDialog.observer,
              ],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              builder: (context, child) {
                final builder = FlutterSmartDialog.init();
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.noScaling),
                  child: Stack(
                    children: [
                      builder(context, child),
                    ],
                  ),
                );
              },
              home: child,
            );
          },
        );
      },
      child: _isFirstLaunch
          ? const OnboardingPage()
          : const InputInformationPage(),
    );
  }
}
