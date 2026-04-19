import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Workiom'**
  String get appName;

  /// No description provided for @stayOrganized.
  ///
  /// In en, this message translates to:
  /// **'Stay organized with'**
  String get stayOrganized;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with email'**
  String get continueWithEmail;

  /// No description provided for @orDivider.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get orDivider;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @createFreeAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your free account'**
  String get createFreeAccount;

  /// No description provided for @letsStartJourney.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start an amazing journey!'**
  String get letsStartJourney;

  /// No description provided for @bySigningUp.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree'**
  String get bySigningUp;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms Of Service'**
  String get termsOfService;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'And'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @enterStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter a strong password'**
  String get enterStrongPassword;

  /// No description provided for @yourWorkEmail.
  ///
  /// In en, this message translates to:
  /// **'Your work email'**
  String get yourWorkEmail;

  /// No description provided for @yourPassword.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get yourPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @passwordNotStrongEnough.
  ///
  /// In en, this message translates to:
  /// **'Not enough strong'**
  String get passwordNotStrongEnough;

  /// No description provided for @passwordStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get passwordStrong;

  /// No description provided for @passwordRuleMinLength.
  ///
  /// In en, this message translates to:
  /// **'Passwords must have at least {count} characters'**
  String passwordRuleMinLength(int count);

  /// No description provided for @passwordRuleUppercase.
  ///
  /// In en, this message translates to:
  /// **'Passwords must have at least one uppercase (A-Z).'**
  String get passwordRuleUppercase;

  /// No description provided for @passwordRuleLowercase.
  ///
  /// In en, this message translates to:
  /// **'Passwords must have at least one lowercase (a-z).'**
  String get passwordRuleLowercase;

  /// No description provided for @passwordRuleDigit.
  ///
  /// In en, this message translates to:
  /// **'Passwords must have at least one digit (0-9).'**
  String get passwordRuleDigit;

  /// No description provided for @passwordRuleSpecial.
  ///
  /// In en, this message translates to:
  /// **'Passwords must have at least one special character.'**
  String get passwordRuleSpecial;

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter your company name'**
  String get enterCompanyName;

  /// No description provided for @yourCompanyOrTeamName.
  ///
  /// In en, this message translates to:
  /// **'Your company or team name'**
  String get yourCompanyOrTeamName;

  /// No description provided for @workspaceNameHint.
  ///
  /// In en, this message translates to:
  /// **'Workspace name*'**
  String get workspaceNameHint;

  /// No description provided for @yourFirstName.
  ///
  /// In en, this message translates to:
  /// **'Your first name'**
  String get yourFirstName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your First name'**
  String get enterFirstName;

  /// No description provided for @yourLastName.
  ///
  /// In en, this message translates to:
  /// **'Your last name'**
  String get yourLastName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your Last name'**
  String get enterLastName;

  /// No description provided for @createWorkspace.
  ///
  /// In en, this message translates to:
  /// **'Create Workspace'**
  String get createWorkspace;

  /// No description provided for @thankYouForChoosing.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing\nWorkiom'**
  String get thankYouForChoosing;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please try again.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorServer;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please sign in again.'**
  String get errorUnauthorized;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknown;

  /// No description provided for @errorTenantTaken.
  ///
  /// In en, this message translates to:
  /// **'This workspace name is already taken. Please choose another.'**
  String get errorTenantTaken;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get errorInvalidEmail;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get errorEmptyField;

  /// No description provided for @errorLettersOnly.
  ///
  /// In en, this message translates to:
  /// **'Only letters are allowed.'**
  String get errorLettersOnly;

  /// No description provided for @errorTenantNameFormat.
  ///
  /// In en, this message translates to:
  /// **'Must start with a letter; only letters, numbers, and dashes.'**
  String get errorTenantNameFormat;

  /// No description provided for @errorTenantNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Workspace name must be at least 2 characters.'**
  String get errorTenantNameTooShort;

  /// No description provided for @tenantAvailableHint.
  ///
  /// In en, this message translates to:
  /// **'https://{name}.workiom.com/'**
  String tenantAvailableHint(String name);

  /// No description provided for @tenantChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking availability...'**
  String get tenantChecking;

  /// No description provided for @tenantAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get tenantAvailable;

  /// No description provided for @tenantTaken.
  ///
  /// In en, this message translates to:
  /// **'Already taken'**
  String get tenantTaken;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loginOutOfScope.
  ///
  /// In en, this message translates to:
  /// **'Login is out of scope for this demo.'**
  String get loginOutOfScope;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @workspaceLabel.
  ///
  /// In en, this message translates to:
  /// **'Workspace URL'**
  String get workspaceLabel;

  /// No description provided for @successSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your Workiom workspace is ready. Welcome aboard!'**
  String get successSubtitle;

  /// No description provided for @successWorkspace.
  ///
  /// In en, this message translates to:
  /// **'Your workspace'**
  String get successWorkspace;

  /// No description provided for @submitting.
  ///
  /// In en, this message translates to:
  /// **'Creating your workspace...'**
  String get submitting;

  /// No description provided for @errorLoadingConfig.
  ///
  /// In en, this message translates to:
  /// **'Unable to load configuration. Check your connection and try again.'**
  String get errorLoadingConfig;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
