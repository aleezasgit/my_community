// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get themeSettings => 'إعدادات المظهر';

  @override
  String get appearance => 'المظهر';

  @override
  String get lightTheme => 'المظهر الفاتح';

  @override
  String get darkTheme => 'المظهر الداكن';

  @override
  String get layout => 'التخطيط';

  @override
  String get leftToRight => 'من اليسار إلى اليمين (إنجليزي)';

  @override
  String get rightToLeft => 'من اليمين إلى اليسار (عربي)';

  @override
  String greeting(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get onboarding1Title => 'حيث\nتنبض المجتمعات\nبالحياة';

  @override
  String get onboarding1Highlight => 'المجتمعات';

  @override
  String get onboarding1Subtitle =>
      'انضم إلى المجتمعات التي تناسب اهتماماتك ومهنتك وأهدافك. اكتشف المحتوى والأشخاص والفرص المصممة خصيصًا لك.';

  @override
  String get onboarding2Title => 'تواصل،\nشارك وانمُ\nمعًا';

  @override
  String get onboarding2Highlight => 'شارك وانمُ';

  @override
  String get onboarding2Subtitle =>
      'تفاعل مع المنشورات والقصص والنقاشات والمعرفة من أشخاص يشاركونك شغفك وخبرتك.';

  @override
  String get onboarding3Title => 'كل\nالفرص\nفي مكان واحد';

  @override
  String get onboarding3Highlight => 'الفرص';

  @override
  String get onboarding3Subtitle =>
      'احصل على استشارات الخبراء وفعاليات المجتمع والمقالات وسوق موثوق—كل ذلك داخل مجتمعك.';

  @override
  String get skip => 'تخطي';

  @override
  String get continueLabel => 'متابعة';

  @override
  String get getStarted => 'ابدأ الآن';
}
