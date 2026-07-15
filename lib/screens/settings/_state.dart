part of 'settings.dart';

class _ScreenState extends ChangeNotifier {
  
  // 🚀 Added BuildContext to execute clean AppRoutes routing dispatches
  void handleSettingTap(BuildContext context, String settingId) {
    debugPrint('Navigating to: $settingId');
    
    switch (settingId) {
      case 'profile_info':
        // Replace with your real profile screen path if different
        AppRoutes.profileSettings.push(context);
        break;
        
      case 'security_settings':
        // 🚀 Maps directly to your new change password screen
        AppRoutes.securitySettings.push(context);
        break;

      case 'account_prefs':
      case 'theme_settings':
       AppRoutes.notifications.push(context);
      case 'notifications':
      AppRoutes.notificationSettings.push(context);
        break;
      
      case 'support':  
      AppRoutes.supportScreen.push(context);
        break;

      case 'faqs':
        AppRoutes.faqScreen.push(context);
        break;

        // Fallback or placeholder targets until those views are fully written
      
    }
  }

  void handleDeleteAccount() {
    debugPrint('Triggering Delete Account Flow');
  }

  void handleLogout() {
    debugPrint('Triggering Logout Flow');
  }
}