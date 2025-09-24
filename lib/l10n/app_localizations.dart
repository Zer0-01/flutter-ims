import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ms.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ms')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @sign_in_to_your_account.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your Account'**
  String get sign_in_to_your_account;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_an_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @forgot_your_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_your_password;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @name_is_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get name_is_required;

  /// No description provided for @email_is_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get email_is_required;

  /// No description provided for @email_must_be_valid.
  ///
  /// In en, this message translates to:
  /// **'Email must be valid'**
  String get email_must_be_valid;

  /// No description provided for @password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_is_required;

  /// No description provided for @password_must_be_at_least_8_characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get password_must_be_at_least_8_characters;

  /// No description provided for @password_must_be_alpha_numeric.
  ///
  /// In en, this message translates to:
  /// **'Password must be alpha numeric'**
  String get password_must_be_alpha_numeric;

  /// No description provided for @confirm_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is required'**
  String get confirm_password_is_required;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @welcome_aboard.
  ///
  /// In en, this message translates to:
  /// **'Welcome Aboard!'**
  String get welcome_aboard;

  /// No description provided for @you_can_now_log_in_and_start_exploring.
  ///
  /// In en, this message translates to:
  /// **'You can now log in and start exploring.'**
  String get you_can_now_log_in_and_start_exploring;

  /// No description provided for @continue_to_login.
  ///
  /// In en, this message translates to:
  /// **'Continue to Login'**
  String get continue_to_login;

  /// No description provided for @user_information.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get user_information;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @eg_john_doe.
  ///
  /// In en, this message translates to:
  /// **'e.g. John Doe'**
  String get eg_john_doe;

  /// No description provided for @eg_60123456789.
  ///
  /// In en, this message translates to:
  /// **'e.g. +60123456789'**
  String get eg_60123456789;

  /// No description provided for @eg_johndoemailcom.
  ///
  /// In en, this message translates to:
  /// **'e.g. qX9lM@example.com'**
  String get eg_johndoemailcom;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @continue_string.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_string;

  /// No description provided for @asterisk.
  ///
  /// In en, this message translates to:
  /// **'*'**
  String get asterisk;

  /// No description provided for @eg_software.
  ///
  /// In en, this message translates to:
  /// **'e.g. Software'**
  String get eg_software;

  /// No description provided for @eg_software_engineer.
  ///
  /// In en, this message translates to:
  /// **'e.g. Software Engineer'**
  String get eg_software_engineer;

  /// No description provided for @organization_information.
  ///
  /// In en, this message translates to:
  /// **'Organization Information'**
  String get organization_information;

  /// No description provided for @password_setup.
  ///
  /// In en, this message translates to:
  /// **'Password Setup'**
  String get password_setup;

  /// No description provided for @eg_ABC_sdn_bhd.
  ///
  /// In en, this message translates to:
  /// **'e.g. ABC Sdn Bhd'**
  String get eg_ABC_sdn_bhd;

  /// No description provided for @registration_failed.
  ///
  /// In en, this message translates to:
  /// **'Registration Failed'**
  String get registration_failed;

  /// No description provided for @please_check_your_details_and_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please check your details and try again.'**
  String get please_check_your_details_and_try_again;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ms'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ms': return AppLocalizationsMs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
