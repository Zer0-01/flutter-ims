// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get sign_in_to_your_account => 'Sign in to your Account';

  @override
  String get dont_have_an_account => 'Don\'t have an account?';

  @override
  String get sign_up => 'Sign Up';

  @override
  String get forgot_your_password => 'Forgot your password?';
}
