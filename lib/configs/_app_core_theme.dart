part of 'configs.dart';

// ─── Color Shades ────────────────────────────────────────────────────────────

class ColorShades {
  final Color? shade100;
  final Color? shade200;
  final Color? shade300;
  final Color? shade400;
  final Color? shade500;
  final Color? shade600;
  final Color? shade700;
  final Color? shade800;
  final Color? main;

  const ColorShades({
    this.shade100,
    this.shade200,
    this.shade300,
    this.shade400,
    this.shade500,
    this.shade600,
    this.shade700,
    this.shade800,
    this.main,
  });

  ColorShades copyWith({
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? main,
  }) {
    return ColorShades(
      shade100: shade100 ?? this.shade100,
      shade200: shade200 ?? this.shade200,
      shade300: shade300 ?? this.shade300,
      shade400: shade400 ?? this.shade400,
      shade500: shade500 ?? this.shade500,
      shade600: shade600 ?? this.shade600,
      shade700: shade700 ?? this.shade700,
      shade800: shade800 ?? this.shade800,
      main: main ?? this.main,
    );
  }
}

// ─── Primary Gradient ────────────────────────────────────────────────────────

class PrimaryGradient {
  final Color startColor;
  final Color endColor;

  const PrimaryGradient({required this.startColor, required this.endColor});

  LinearGradient get gradient => LinearGradient(colors: [startColor, endColor]);

  PrimaryGradient copyWith({Color? startColor, Color? endColor}) {
    return PrimaryGradient(
      startColor: startColor ?? this.startColor,
      endColor: endColor ?? this.endColor,
    );
  }
}

// ─── AppCoreTheme ────────────────────────────────────────────────────────────

class AppCoreTheme {
  final ColorShades primary;
  final ColorShades accent;
  final ColorShades background;
  final ColorShades text;
  final ColorShades lightGrey;
  final ColorShades error;
  final PrimaryGradient primaryGradient;

  final Color? white;
  final Color? black;

  const AppCoreTheme({
    required this.primary,
    required this.accent,
    required this.background,
    required this.text,
    required this.lightGrey,
    this.white,
    required this.error,
    this.black,
    required this.primaryGradient,
  });

  Color? get purple => null;

  AppCoreTheme copyWith({
    ColorShades? primary,
    ColorShades? accent,
    ColorShades? background,
    ColorShades? text,
    ColorShades? lightGrey,
    ColorShades? error,
    PrimaryGradient? primaryGradient,
    Color? white,
    Color? black,
  }) {
    return AppCoreTheme(
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      text: text ?? this.text,
      lightGrey: lightGrey ?? this.lightGrey,
      white: white ?? this.white,
      black: black ?? this.black,
      error: error ?? this.error,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
