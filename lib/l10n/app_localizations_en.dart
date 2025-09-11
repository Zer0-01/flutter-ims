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

  @override
  String get create_account => 'Create Account';

  @override
  String get already_have_an_account => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get name_is_required => 'Name is required';

  @override
  String get email_is_required => 'Email is required';

  @override
  String get email_must_be_valid => 'Email must be valid';

  @override
  String get password_is_required => 'Password is required';

  @override
  String get password_must_be_at_least_6_characters => 'Password must be at least 6 characters';

  @override
  String get password_must_be_alpha_numeric => 'Password must be alpha numeric';

  @override
  String get confirm_password_is_required => 'Confirm Password is required';

  @override
  String get passwords_do_not_match => 'Passwords do not match';
}
