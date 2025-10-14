import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jobdi/core/constants/constants.dart';
import 'package:jobdi/core/utils/injection.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/l10n/app_localizations.dart' show AppLocalizations;
import 'package:jobdi/presentation/pages/onboarding/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      child: const OnboardingPage(),
    );
  }
}
