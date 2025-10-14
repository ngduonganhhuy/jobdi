import 'package:flutter/widgets.dart';
import 'package:jobdi/l10n/app_localizations.dart' show AppLocalizations;

extension AppLocalizationsX on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this);
}
