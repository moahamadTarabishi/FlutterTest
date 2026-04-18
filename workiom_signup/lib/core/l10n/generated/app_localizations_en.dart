// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Workiom';

  @override
  String get stayOrganized => 'Stay organized with';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithEmail => 'Continue with email';

  @override
  String get orDivider => 'Or';

  @override
  String get signIn => 'Sign in';

  @override
  String get createFreeAccount => 'Create your free account';

  @override
  String get letsStartJourney => 'Let\'s start an amazing journey! 👋';

  @override
  String get bySigningUp => 'By signing up, you agree';

  @override
  String get termsOfService => 'Terms Of Service';

  @override
  String get and => 'And';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get enterStrongPassword => 'Enter a strong password';

  @override
  String get yourWorkEmail => 'Your work email';

  @override
  String get yourPassword => 'Your password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get passwordNotStrongEnough => 'Not enough strong';

  @override
  String get passwordStrong => 'Strong password';

  @override
  String passwordRuleMinLength(int count) {
    return 'Passwords must have at least $count characters';
  }

  @override
  String get passwordRuleUppercase =>
      'Passwords must have at least one uppercase (A-Z).';

  @override
  String get passwordRuleLowercase =>
      'Passwords must have at least one lowercase (a-z).';

  @override
  String get passwordRuleDigit =>
      'Passwords must have at least one digit (0-9).';

  @override
  String get passwordRuleSpecial =>
      'Passwords must have at least one special character.';

  @override
  String get enterCompanyName => 'Enter your company name';

  @override
  String get yourCompanyOrTeamName => 'Your company or team name';

  @override
  String get workspaceNameHint => 'Workspace name*';

  @override
  String get yourFirstName => 'Your first name';

  @override
  String get enterFirstName => 'Enter your First name';

  @override
  String get yourLastName => 'Your last name';

  @override
  String get enterLastName => 'Enter your Last name';

  @override
  String get createWorkspace => 'Create Workspace';

  @override
  String get thankYouForChoosing => 'Thank you for choosing\nWorkiom';

  @override
  String get english => 'English';

  @override
  String get errorNetwork => 'No internet connection. Please try again.';

  @override
  String get errorTimeout => 'Request timed out. Please try again.';

  @override
  String get errorServer => 'Server error. Please try again later.';

  @override
  String get errorUnauthorized => 'Session expired. Please sign in again.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';

  @override
  String get errorTenantTaken =>
      'This workspace name is already taken. Please choose another.';

  @override
  String get errorInvalidCredentials => 'Invalid email or password.';

  @override
  String get errorInvalidEmail => 'Please enter a valid email address.';

  @override
  String get errorEmptyField => 'This field is required.';

  @override
  String get errorLettersOnly => 'Only letters are allowed.';

  @override
  String get errorTenantNameFormat =>
      'Must start with a letter; only letters, numbers, and dashes.';

  @override
  String get errorTenantNameTooShort =>
      'Workspace name must be at least 2 characters.';

  @override
  String tenantAvailableHint(String name) {
    return 'https://$name.workiom.com/';
  }

  @override
  String get tenantChecking => 'Checking availability...';

  @override
  String get tenantAvailable => 'Available';

  @override
  String get tenantTaken => 'Already taken';

  @override
  String get retry => 'Retry';

  @override
  String get back => 'Back';

  @override
  String get welcomeTitle => 'Welcome to Workiom';

  @override
  String get welcomeSubtitle =>
      'The all-in-one platform to organize your work and collaborate with your team.';

  @override
  String get loginSubtitle =>
      'Enter your credentials to access your workspace.';

  @override
  String get loginOutOfScope => 'Login is out of scope for this demo.';

  @override
  String get nextStep => 'Next';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get workspaceLabel => 'Workspace URL';

  @override
  String get firstNameLabel => 'First name';

  @override
  String get lastNameLabel => 'Last name';

  @override
  String get successTitle => 'You\'re all set!';

  @override
  String get successSubtitle =>
      'Your Workiom workspace is ready. Welcome aboard!';

  @override
  String get successWorkspace => 'Your workspace';

  @override
  String get submitting => 'Creating your workspace...';
}
