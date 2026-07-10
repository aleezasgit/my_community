import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  LocaleController._();
  static final LocaleController instance = LocaleController._();

  static const _prefsKey = 'app_locale';

  static const supportedLocales = [Locale('en'), Locale('ar')];

  Locale _locale = const Locale('en'); // default English
  Locale get locale => _locale;
  bool get isRtl => _locale.languageCode == 'ar';

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _locale = switch (prefs.getString(_prefsKey)) {
      'ar' => const Locale('ar'),
      _ => const Locale('en'),
    };
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, locale.languageCode);
  }

  void setEnglish() => setLocale(const Locale('en'));
  void setArabic() => setLocale(const Locale('ar'));
}

class LocaleScope extends InheritedNotifier<LocaleController> {
  const LocaleScope({
    super.key,
    required LocaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static LocaleController s(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope missing — wrap MyApp in LocaleScope.');
    return scope!.notifier!;
  }
}
