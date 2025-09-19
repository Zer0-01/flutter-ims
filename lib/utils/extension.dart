import 'package:flutter/material.dart';
import 'package:flutter_ims/l10n/app_localizations.dart';

extension AppContextX on BuildContext {
  // Localization
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  // Theme
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
