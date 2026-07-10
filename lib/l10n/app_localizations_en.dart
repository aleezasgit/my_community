// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get layout => 'Layout';

  @override
  String get leftToRight => 'Left to Right (ENG)';

  @override
  String get rightToLeft => 'Right to Left (Arabic)';

  @override
  String greeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get onboarding1Title => 'Where\nCommunities\nCome Alive';

  @override
  String get onboarding1Highlight => 'Communities';

  @override
  String get onboarding1Subtitle =>
      'Join communities that match your interests, profession, and goals. Discover content, people, and opportunities tailored just for you.';

  @override
  String get onboarding2Title => 'Connect,\nShare & Grow\nTogether';

  @override
  String get onboarding2Highlight => 'Share & Grow';

  @override
  String get onboarding2Subtitle =>
      'Engage with posts, stories, discussions, and knowledge from people who share your passions and expertise.';

  @override
  String get onboarding3Title => 'All\nOpportunities\nIn One Place';

  @override
  String get onboarding3Highlight => 'Opportunities';

  @override
  String get onboarding3Subtitle =>
      'Access expert consultations, community events, articles, and a trusted marketplace—all within your community.';

  @override
  String get skip => 'Skip';

  @override
  String get continueLabel => 'Continue';

  @override
  String get getStarted => 'Get Started';
}
