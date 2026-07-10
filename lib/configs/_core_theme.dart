part of 'configs.dart';

const headingFontFamily = 'Fraunces';
const bodyFontFamily = 'HankenGrotesk';

final themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.light.background.main,
    foregroundColor:
        AppTheme.light.text.shade800, // was text.shade100 (too light)
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.light.primary.main),
  ),
  useMaterial3: true,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    indicatorColor: AppTheme.light.lightGrey.shade800,
    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: AppTheme.light.primary.main),
    ),
  ),
  primaryColor: AppTheme.light.primary.main,
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.light.background.main,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.light.primary.main),
  ),
  primaryColorDark: AppTheme.light.primary.main,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.light.primary.main,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: AppTheme.light.primary.main,
    onPrimary: AppTheme.light.white,
    secondary: AppTheme.light.primary.main,
    surface: AppTheme.light.background.shade200,
    onSurface: AppTheme.light.text.shade800,
    onSurfaceVariant: AppTheme.light.text.main,
    outline: AppTheme.light.lightGrey.main,
    error: AppTheme.light.error.main,
    onError: AppTheme.light.white,
  ),
);

final themeDark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.dark.background.main,
    foregroundColor:
        AppTheme.dark.text.shade800, // now white via dark text override
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.dark.primary.main),
  ),
  useMaterial3: true,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    indicatorColor: AppTheme.dark.lightGrey.shade300,
    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: AppTheme.dark.primary.main),
    ),
  ),
  primaryColor: AppTheme.dark.primary.main,
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.dark.background.main,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.dark.primary.main),
  ),
  primaryColorDark: AppTheme.dark.primary.main,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.dark.primary.main,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: AppTheme.dark.primary.main,
    onPrimary: AppTheme.dark.white,
    secondary: AppTheme.dark.primary.main,
    surface: AppTheme.dark.background.shade200,
    onSurface: AppTheme.dark.text.shade800,
    onSurfaceVariant: AppTheme.dark.text.main,
    outline: AppTheme.dark.lightGrey.main,
    error: AppTheme.dark.error.main,
    onError: AppTheme.dark.white,
  ),
);
