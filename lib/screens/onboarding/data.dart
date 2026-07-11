part of 'onboarding.dart';

List<Map<String, String>> onboardingPages(
  AppLocalizations l10n, {
  required bool isDark,
}) => [
  {
    "image": !isDark ? "assets/pngs/OB_1_light.png" : "assets/pngs/OB_1.png",
    "title": l10n.onboarding1Title,
    "highlight": l10n.onboarding1Highlight,
    "subtitle": l10n.onboarding1Subtitle,
  },
  {
    "image": !isDark ? "assets/pngs/OB_2_light.png" : "assets/pngs/OB_2.png",
    "title": l10n.onboarding2Title,
    "highlight": l10n.onboarding2Highlight,
    "subtitle": l10n.onboarding2Subtitle,
  },
  {
    "image": !isDark ? "assets/pngs/OB_3_light.png" : "assets/pngs/OB_3.png",
    "title": l10n.onboarding3Title,
    "highlight": l10n.onboarding3Highlight,
    "subtitle": l10n.onboarding3Subtitle,
  },
];
