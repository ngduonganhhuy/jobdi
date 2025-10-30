import 'package:flutter/cupertino.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/utils/utils.dart';
import 'package:jobdi/presentation/pages/activity/activity_detail_page.dart' show ActivityDetailPage;
import 'package:jobdi/presentation/pages/auth/input_information_page.dart';
import 'package:jobdi/presentation/pages/auth/login_page.dart';
import 'package:jobdi/presentation/pages/auth/otp_page.dart';
import 'package:jobdi/presentation/pages/auth/register_page.dart';
import 'package:jobdi/presentation/pages/auth/role_selector_page.dart' show RoleSelectorPage;
import 'package:jobdi/presentation/pages/home/home_page.dart';
import 'package:jobdi/presentation/pages/home/main_page.dart';

class NavigatorService {
  static Future<T?> _goTo<T extends Object?>(
    BuildContext context,
    BasePage screen, {
    Object? arguments,
    bool clearToHome = false,
    bool clearStack = false,
    bool replace = false,
    T? resultForReplace,
  }) async {
    Utils.closeKeyboard(context);
    final newRoute = CupertinoPageRoute<T>(
      builder: (context) => screen,
      settings: RouteSettings(name: screen.screenName),
    );
    if (clearToHome) {
      return Navigator.of(
        context,
      ).pushAndRemoveUntil<T>(newRoute, (route) => route.isFirst);
    }
    if (clearStack) {
      return Navigator.of(
        context,
      ).pushAndRemoveUntil<T>(newRoute, (route) => false);
    }
    if (replace) {
      return Navigator.of(
        context,
      ).pushReplacement<T, T>(newRoute, result: resultForReplace);
    }
    return Navigator.of(context).push<T>(newRoute);
  }

  static Future<T?> goToCustom<T extends Object?>(
    BuildContext context, {
    required BasePage screen,
    required String screenName,
    bool clearStack = true,
    bool replace = false,
  }) async {
    return _goTo<T>(context, screen, clearStack: clearStack, replace: replace);
  }

  static void goBack<T>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  static void goBackUntil<T>(BuildContext context, String untilScreenName) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(
        context,
      ).popUntil((route) => route.settings.name == untilScreenName);
    }
  }

  static Future<T?> goToMainPage<T extends Object?>(
    BuildContext context,
  ) async {
    return _goTo<T>(context, const MainPage(), clearStack: true);
  }

  static Future<T?> goToHomePage<T extends Object?>(
    BuildContext context,
  ) async {
    return _goTo<T>(context, const HomePage(), clearStack: true);
  }

  static Future<T?> goToLoginPage<T extends Object?>(
    BuildContext context, {
    bool clearStack = true,
    bool replace = false,
  }) async {
    return _goTo<T>(
      context,
      const LoginPage(),
      clearStack: clearStack,
      replace: replace,
    );
  }

  static Future<T?> goToRegisterPage<T extends Object?>(
    BuildContext context, {
    bool replace = true,
    bool clearStack = true,
  }) async {
    return _goTo<T>(
      context,
      const RegisterPage(),
      replace: replace,
      clearStack: clearStack,
    );
  }

  static Future<T?> goToOTPPage<T extends Object?>(BuildContext context) async {
    return _goTo<T>(
      context,
      const OTPPage(),
    );
  }

  static Future<T?> goToRoleSelectorPage<T extends Object?>(
    BuildContext context, {
    bool replace = true,
  }) async {
    return _goTo<T>(context, const RoleSelectorPage(), replace: replace);
  }

  static Future<T?> goToInputInformationPage<T extends Object?>(
    BuildContext context, {
    bool replace = true,
  }) async {
    return _goTo<T>(context, const InputInformationPage(), replace: replace);
  }

  static Future<T?> goToActivityDetailPage<T extends Object?>(BuildContext context) async {
    return _goTo<T>(context, const ActivityDetailPage());
  }
}
