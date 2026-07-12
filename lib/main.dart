import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_community/l10n/app_localizations.dart';
import 'package:my_community/router/router.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/states/locale_controller.dart';
import 'package:my_community/states/theme_controller.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'configs/configs.dart' as theme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.instance.load();
  await LocaleController.instance.load();

  services.SystemChrome.setSystemUIOverlayStyle(
    const services.SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  services.SystemChrome.setEnabledSystemUIMode(
    services.SystemUiMode.edgeToEdge,
    overlays: [services.SystemUiOverlay.top, services.SystemUiOverlay.bottom],
  );

  runApp(
    ThemeScope(
      controller: ThemeController.instance,
      child: LocaleScope(
        controller: LocaleController.instance,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<NavigatorObserver> observers = [];

  @override
  Widget build(BuildContext context) {
    final controller = ThemeScope.s(context);
    final localeController = LocaleScope.s(context);

    return AnimatedBuilder(
      animation: Listenable.merge([controller, localeController]),
      builder: (_, _) {
        return AnnotatedRegion<services.SystemUiOverlayStyle>(
          value: services.SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: true,
            statusBarIconBrightness: controller.isDark
                ? Brightness.light
                : Brightness.dark,
            statusBarBrightness: controller.isDark
                ? Brightness.dark
                : Brightness.light,
          ),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                navigatorObservers: [...observers, NavigationHistoryObserver()],
                debugShowCheckedModeBanner: false,
                theme: theme.themeLight,
                darkTheme: theme.themeDark,
                themeMode: controller.mode,
                locale: localeController.locale,
                supportedLocales: LocaleController.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: (context, child) {
                  theme.App.init(context);
                  return child!;
                },
                initialRoute: AppRoutes.TextonlyScreen,
                onGenerateRoute: onGenerateRoutes,
                routes: appRoutes,
              );
            },
          ),
        );
      },
    );
  }
}
