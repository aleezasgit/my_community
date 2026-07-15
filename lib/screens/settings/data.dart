part of 'settings.dart';

// Group 1: Core Account Settings
final List<Map<String, String>> mainSettings = [
  {'id': 'profile_info', 'label': 'Profile Info', 'icon': 'assets/svgs/User.svg'},
  {'id': 'account_prefs', 'label': 'Account Preferences', 'icon': 'assets/svgs/setting-4.svg'}, // Adjust icon paths as needed
  {'id': 'security_settings', 'label': 'Security Settings', 'icon': 'assets/svgs/color-swatch.svg'},
  {'id': 'theme_settings', 'label': 'Theme Settings', 'icon': 'assets/svgs/setting-4.svg', },
  {'id': 'notifications', 'label': 'Notifications Settings', 'icon': 'assets/svgs/Bell Off.svg'},
];

// Group 2: Help & Support Settings
final List<Map<String, String>> supportSettings = [
  {'id': 'support', 'label': 'Support', 'icon': 'assets/svgs/Question Square.svg'},
  {'id': 'faqs', 'label': 'Faqs', 'icon': 'assets/svgs/Question Square.svg'},
];