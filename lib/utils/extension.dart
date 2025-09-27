import 'package:flutter/material.dart';
import 'package:flutter_ims/l10n/app_localizations.dart';

extension AppContextX on BuildContext {
  // Localization
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  // Theme
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension StringX on String {
  String get initials {
    final name = trim();
    if (name.isEmpty) return "?";

    final parts = name.split(RegExp(r"\s+"));

    if (parts.length == 1) {
      // Single word → take first 2 letters
      return parts.first
          .substring(0, parts.first.length >= 2 ? 2 : 1)
          .toUpperCase();
    } else {
      // Multi-word → take first letter of first 2 words
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
  }
}
