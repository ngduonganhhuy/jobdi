// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get descSignIn => 'Nhập số điện thoại của anh/chị.';

  @override
  String get phone => 'Số điện thoại';

  @override
  String get notRegisterYet => 'Chưa có tài khoản?';

  @override
  String get signUp => 'Đăng ký';
}
