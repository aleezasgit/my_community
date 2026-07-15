import 'package:flutter/material.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/community_testingscreen.dart';
import 'package:my_community/screens/aleeza_widgets/friends.dart';
import 'package:my_community/screens/aleeza_widgets/friends/document_post.dart';
import 'package:my_community/screens/aleeza_widgets/friends/single_video.dart';
import 'package:my_community/screens/aleeza_widgets/friends/textonly.dart';
import 'package:my_community/screens/aleeza_widgets/friends/yourown_post_multiple_photo.dart';
import 'package:my_community/screens/aleeza_widgets/friends/yourown_post_single_photo.dart';
import 'package:my_community/screens/aleeza_widgets/join_community.dart';
import 'package:my_community/screens/aleeza_widgets/news_section/articles.dart';
import 'package:my_community/screens/aleeza_widgets/news_section/details.dart';
import 'package:my_community/screens/aleeza_widgets/news_section/news_card.dart';
import 'package:my_community/screens/aleeza_widgets/pick_interests.dart';
import 'package:my_community/screens/aleeza_widgets/share_your_first_moment.dart';
import 'package:my_community/screens/aleeza_widgets/tell_us_about.dart';
import 'package:my_community/screens/create_account/create_account.dart';
import 'package:my_community/screens/create_new_password/create_new_password.dart';
import 'package:my_community/screens/faq/faq.dart';
import 'package:my_community/screens/findfriends/find_friends.dart';
import 'package:my_community/screens/forgot_password/forgot_password.dart';
import 'package:my_community/screens/login/login.dart';
import 'package:my_community/screens/notification/notification.dart';
import 'package:my_community/screens/notification_settings/notification_settings.dart';
import 'package:my_community/screens/onboarding/onboarding.dart';
import 'package:my_community/screens/profile/profile.dart';
import 'package:my_community/screens/profile_setting/profile_settings.dart';
import 'package:my_community/screens/security_settings/security_settings.dart';
import 'package:my_community/screens/settings/settings.dart';
import 'package:my_community/screens/setup_account/setup_account.dart';
import 'package:my_community/screens/share_friends/share_profile.dart';
import 'package:my_community/screens/splash/splash.dart';
import 'package:my_community/screens/support/support.dart';
import 'package:my_community/screens/theme_setting_test.dart';
import 'package:my_community/screens/verify_identity/verify_identity.dart';
import 'package:my_community/screens/verify_mobile_number/verify_mobile_number.dart';


final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.onboarding: (_) => const OnboardingScreen(),
  AppRoutes.settingsAndLanguage: (_) => const ThemeSettingsScreen(),
  AppRoutes.createAccount: (_) => const CreateAccountScreen(),
  AppRoutes.verifyMobileNumber: (_) => const VerifyMobileNumberScreen(),
  AppRoutes.setupAccount: (_) => const SetupAccountScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.forgotPassword: (_) => const ForgotPasswordScreen(),
  AppRoutes.verifyIdentity: (_) => const VerifyIdentityScreen(),
  AppRoutes.createNewPassword: (_) => const CreateNewPasswordScreen(),
    AppRoutes.TestingScreen: (_) => const GenderScreen(),
    AppRoutes.InterestScreen: (_) => const InterestsScreen(),
    AppRoutes.FriendsScreen: (_) => const FriendsScreen(),
    AppRoutes.CommunityScreen: (_) => const CommunitiesScreen(),
    AppRoutes.ShareMomentScreen: (_) => const ShareMomentScreen(),
    AppRoutes.SingleVideoScreen: (_) => const SingleVideo(),
    AppRoutes.yourOwnPostSinglePhotoScreen: (_) => const OwnPostSinglePhotoScreen(),
    AppRoutes.documentPostScreen: (_) => const DocumentPostScreen(),
    AppRoutes.yourOwnPostMultiplePhotoScreen: (_) => const PhotoPostScreen(),
    AppRoutes.TextonlyScreen: (_) => const TextPostScreen(),
    AppRoutes.newsCardScreen: (_) => const NewsCardScreen(),
    AppRoutes.newsDetailsScreen: (_) => const NewsDetailScreen(),
    AppRoutes.newsTextCardScreen: (_) => const NewsTextCardScreen(),
    AppRoutes.TestingCommunityScreen: (_) => const GroupProfileDisplayScreen(),
    AppRoutes.ProfileScreen: (_) => const UserFeedProfileScreen(),
    AppRoutes.findfriendscreen: (_) => const FindFriendsScreen(),
    AppRoutes.shareProfileScreen: (_) => const ShareProfileScreen(),
    AppRoutes.settingScreen: (_) => const SettingsScreen(),
    AppRoutes.faqScreen: (_) => const FaqScreen(),
    AppRoutes.supportScreen: (_) => const SupportScreen(),
    AppRoutes.securitySettings: (_) => const SecuritySettingsScreen(),
     AppRoutes.profileSettings: (_) => const ProfileSettingsScreen(),
     AppRoutes.notificationSettings: (_) => const NotificationSettingsScreen(),
     AppRoutes.notifications: (_) => const NotificationsScreen(),
    

};

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    SlideRoute(
      settings: RouteSettings(name: ModalRoute.of(context)?.settings.name),
      child: screen,
    ),
  );
}

void navigateToFullScreen(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(context, rootNavigator: true).pushNamed(
    routeName,
    arguments: arguments,
  );
}

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return FadeRoute(settings: settings, child: const SplashScreen());
    default:
      return null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) {
            return FadeTransition(opacity: ani1, child: child);
          },
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  ScaleRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) {
            final scaleAnimation = Tween(begin: 0.95, end: 1.0).animate(ani1);

            return ScaleTransition(scale: scaleAnimation, child: child);
          },
        );
}

class SlideRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  SlideRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            final offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
}
