part of 'configs.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h1bm;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h2bm;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h3bm;
  static TextStyle? h4;
  static TextStyle? h4b;
  static TextStyle? h4bm;
  static TextStyle? h5;
  static TextStyle? h5b;
  static TextStyle? h5bm;
  static TextStyle? h6;
  static TextStyle? h6b;
  static TextStyle? h6bm;
  static TextStyle? h7;
  static TextStyle? h7b;
  static TextStyle? h7bm;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b1bm;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b2bm;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l1bm;
  static TextStyle? l2;
  static TextStyle? l2b;
  static TextStyle? l2bm;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    const b = FontWeight.bold;

    // BASE STYLES
    final TextStyle headingBase = TextStyle(
      fontFamily: headingFontFamily,
      color: AppTheme.of(context).text.shade800!,
      letterSpacing: 0,
    );

    final TextStyle bodyBase = TextStyle(
      fontFamily: bodyFontFamily,
      color: AppTheme.of(context).text.shade800!,
      letterSpacing: 0,
    );

    // ---------------- HEADINGS ----------------

    h1 = headingBase.copyWith(fontSize: 40.h);
    h1b = h1!.copyWith(fontWeight: b);
    h1bm = h1!.copyWith(fontWeight: FontWeight.w500);

    h2 = headingBase.copyWith(fontSize: 36.h);
    h2b = h2!.copyWith(fontWeight: b);
    h2bm = h2!.copyWith(fontWeight: FontWeight.w500);

    h3 = headingBase.copyWith(fontSize: 28.h, height: 1.2);
    h3b = h3!.copyWith(fontWeight: b);
    h3bm = h3!.copyWith(fontWeight: FontWeight.w500);

    h4 = headingBase.copyWith(fontSize: 24.h, height: 1.4);
    h4b = h4!.copyWith(fontWeight: b);
    h4bm = h4!.copyWith(fontWeight: FontWeight.w500);

    h5 = headingBase.copyWith(fontSize: 20.h, height: 1.4);
    h5b = h5!.copyWith(fontWeight: b);
    h5bm = h5!.copyWith(fontWeight: FontWeight.w500);

    h6 = headingBase.copyWith(fontSize: 16.h, height: 1.4);
    h6b = h6!.copyWith(fontWeight: b);
    h6bm = h6!.copyWith(fontWeight: FontWeight.w500);

    h7 = headingBase.copyWith(fontSize: 14.h, height: 1.4);
    h7b = h7!.copyWith(fontWeight: b);
    h7bm = h7!.copyWith(fontWeight: FontWeight.w500);

    // ---------------- BODY ----------------

    b1 = bodyBase.copyWith(fontSize: 16.h, height: 1.4);
    b1b = b1!.copyWith(fontWeight: b);
    b1bm = b1!.copyWith(fontWeight: FontWeight.w500);

    b2 = bodyBase.copyWith(fontSize: 14.h, height: 1.4);
    b2b = b2!.copyWith(fontWeight: b);
    b2bm = b2!.copyWith(fontWeight: FontWeight.w500);

    // ---------------- LABELS ----------------

    l1 = bodyBase.copyWith(fontSize: 12.h);
    l1b = l1!.copyWith(fontWeight: b);
    l1bm = l1!.copyWith(fontWeight: FontWeight.w500);

    l2 = bodyBase.copyWith(fontSize: 10.h);
    l2b = l2!.copyWith(fontWeight: b);
    l2bm = l2!.copyWith(fontWeight: FontWeight.w500);
  }
}
