part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    // PRIMARY group
    primary: ColorShades(
      main: const Color(0xFF566B4D), // Sage
      shade100: const Color(0xFFEEF0ED),
      shade200: const Color(0xFFE6E9E4),
      shade300: const Color(0xFFCBD1C8),
      shade500: const Color(0xFF45563E),
      shade600: const Color(0xFF34402E),
      shade700: const Color(0xFF273023),
      shade800: const Color(0xFF1E251B),
    ),

    // ACCENT group (placeholder ramp — replace with Figma accent hexes)
    accent: ColorShades(
      shade100: const Color(0xFFFBF0EC),
      shade200: const Color(0xFFF6E7DF), // Clay Tint
      shade300: const Color(0xFFF1D0C3),
      shade400: const Color(0xFFEDD8FA),
      shade500: const Color(0xFFBD5E39),
      shade600: const Color(0xFFA85332),
      shade700: const Color(0xFF9E4E2F),
      shade800: const Color(0xFF5E2F1C),
      main: const Color(0xFFBB5836), // Clay
    ),

    // BACKGROUND group  (shade200 == Card surface)
    background: ColorShades(
      shade100: const Color(0xFFFDFCFB),
      shade200: const Color(0xFFFBF8F1), // Card
      shade400: const Color(0xFFDBD6CC),
      shade500: const Color(0xFFC2BEB6),
      main: const Color(0xFFF3EEE3), // Paper
    ),

    // TEXT group
    text: ColorShades(
      main: const Color(0xFF6A675B), // Ink Soft (muted)
      shade100: const Color(0xFFDDDDDC),
      shade200: const Color(0xFFE8E8E8),
      shade300: const Color(0xFFDDDDDC),
      shade600: const Color(0xFF1C1B17), // Ink
      shade700: const Color(0xFF161612),
      shade800: const Color(0xFF1C1B17), // Ink
    ),

    // LIGHT GREY group
    lightGrey: ColorShades(
      main: const Color(0xFFCABFA6), // Line
      shade300: const Color(0xFFE6E6E6),
      shade200: const Color(0xFFFCFCFC),
      shade100: const Color(0xFFFFFFFF),
      shade400: const Color(0xFFD9D9D9),
      shade500: const Color(0xFF8697AC),
      shade600: const Color(0xFFE7ECF0),
    ),

    // ERROR group
    error: ColorShades(
      main: Color(0xFFF65555),
      shade100: Color(0xFFFEE6E6),
      shade800: Color(0xFFDF1C41),
    ),

    // PRIMARY GRADIENT
    primaryGradient: PrimaryGradient(
      startColor: const Color(0xFF05F9FE),
      endColor: const Color(0xFF8E43EF),
    ),

    // SINGLE COLORS (no shades)
    white: const Color(0xFFFFFFFF),
    black: const Color(0xFF040714),
  );

  static AppCoreTheme light = _core;

  // Dark = light, with the four warm-charcoal overrides + a text flip so the
  // near-black Ink shades become legible (white) on dark surfaces.
  static AppCoreTheme dark = _core.copyWith(
    primary: _core.primary.copyWith(
      main: const Color(0xFFA4BC8F), // Sage Light
    ),
    accent: _core.accent.copyWith(
      main: const Color(0xFFDD8157), // Clay Light
    ),
    background: _core.background.copyWith(
      main: const Color(0xFF1A1815), // Paper Dark
      shade200: const Color(0xFF252119), // Card Dark
    ),
    text: _core.text.copyWith(
      shade600: const Color(0xFFFFFFFF), // Ink -> white on dark
      shade700: const Color(0xFFFFFFFF),
      shade800: const Color(0xFFFFFFFF), // Ink -> lightGrey.shade100 on dark
    ),
  );

  static AppCoreTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
