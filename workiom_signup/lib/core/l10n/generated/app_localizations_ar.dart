// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'ووركيوم';

  @override
  String get stayOrganized => 'ابقَ منظمًا مع';

  @override
  String get continueWithGoogle => 'المتابعة مع Google';

  @override
  String get continueWithEmail => 'المتابعة بالبريد الإلكتروني';

  @override
  String get orDivider => 'أو';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get createFreeAccount => 'أنشئ حسابك المجاني';

  @override
  String get letsStartJourney => 'لنبدأ رحلة رائعة!';

  @override
  String get bySigningUp => 'بالتسجيل، توافق على';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get and => 'و';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get enterStrongPassword => 'أدخل كلمة مرور قوية';

  @override
  String get yourWorkEmail => 'بريدك الإلكتروني المهني';

  @override
  String get yourPassword => 'كلمة مرورك';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get passwordNotStrongEnough => 'غير قوية بما يكفي';

  @override
  String get passwordStrong => 'كلمة مرور قوية';

  @override
  String passwordRuleMinLength(int count) {
    return 'يجب أن تحتوي كلمة المرور على $count أحرف على الأقل';
  }

  @override
  String get passwordRuleUppercase =>
      'يجب أن تحتوي على حرف كبير واحد على الأقل (A-Z).';

  @override
  String get passwordRuleLowercase =>
      'يجب أن تحتوي على حرف صغير واحد على الأقل (a-z).';

  @override
  String get passwordRuleDigit => 'يجب أن تحتوي على رقم واحد على الأقل (0-9).';

  @override
  String get passwordRuleSpecial => 'يجب أن تحتوي على رمز خاص واحد على الأقل.';

  @override
  String get enterCompanyName => 'أدخل اسم شركتك';

  @override
  String get yourCompanyOrTeamName => 'اسم شركتك أو فريقك';

  @override
  String get workspaceNameHint => 'اسم مساحة العمل*';

  @override
  String get yourFirstName => 'اسمك الأول';

  @override
  String get enterFirstName => 'أدخل اسمك الأول';

  @override
  String get yourLastName => 'اسمك الأخير';

  @override
  String get enterLastName => 'أدخل اسمك الأخير';

  @override
  String get createWorkspace => 'إنشاء مساحة العمل';

  @override
  String get thankYouForChoosing => 'شكرًا لاختيارك\nووركيوم';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get errorNetwork => 'لا يوجد اتصال بالإنترنت. يرجى المحاولة مرة أخرى.';

  @override
  String get errorTimeout => 'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى.';

  @override
  String get errorServer => 'خطأ في الخادم. يرجى المحاولة لاحقًا.';

  @override
  String get errorUnauthorized => 'انتهت الجلسة. يرجى تسجيل الدخول مجددًا.';

  @override
  String get errorUnknown => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get errorTenantTaken =>
      'اسم مساحة العمل هذا مأخوذ بالفعل. يرجى اختيار اسم آخر.';

  @override
  String get errorInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get errorInvalidEmail => 'يرجى إدخال عنوان بريد إلكتروني صالح.';

  @override
  String get errorEmptyField => 'هذا الحقل مطلوب.';

  @override
  String get errorLettersOnly => 'يُسمح بالحروف فقط.';

  @override
  String get errorTenantNameFormat =>
      'يجب أن يبدأ بحرف؛ يُسمح بالحروف والأرقام والشرطات فقط.';

  @override
  String get errorTenantNameTooShort =>
      'يجب أن يتكون اسم مساحة العمل من حرفين على الأقل.';

  @override
  String tenantAvailableHint(String name) {
    return 'https://$name.workiom.com/';
  }

  @override
  String get tenantChecking => 'جارٍ التحقق من التوفر...';

  @override
  String get tenantAvailable => 'متاح';

  @override
  String get tenantTaken => 'مأخوذ بالفعل';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get loginOutOfScope => 'تسجيل الدخول خارج نطاق هذا العرض التوضيحي.';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get workspaceLabel => 'رابط مساحة العمل';

  @override
  String get successSubtitle =>
      'مساحة عمل ووركيوم الخاصة بك جاهزة. أهلًا وسهلًا!';

  @override
  String get successWorkspace => 'مساحة عملك';

  @override
  String get submitting => 'جارٍ إنشاء مساحة العمل...';

  @override
  String get errorLoadingConfig =>
      'تعذّر تحميل الإعدادات. تحقق من اتصالك وأعد المحاولة.';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get nameLabel => 'الاسم';
}
