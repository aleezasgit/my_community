import 'package:flutter/material.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/l10n/app_localizations.dart';
import 'package:my_community/states/locale_controller.dart';
import 'package:my_community/states/theme_controller.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final l10n = AppLocalizations.of(context);
    final themeC = ThemeScope.s(context);
    final localeC = LocaleScope.s(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(l10n.themeSettings, style: AppText.b1bm),
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.of(context).text.shade800,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          _SectionLabel(l10n.appearance),
          const SizedBox(height: 12),
          _SelectableCard(
            title: l10n.lightTheme,
            selected: !themeC.isDark,
            onTap: () => themeC.setMode(ThemeMode.light),
            preview: const _ThemePreview(dark: false),
          ),
          const SizedBox(height: 16),
          _SelectableCard(
            title: l10n.darkTheme,
            selected: themeC.isDark,
            onTap: () => themeC.setMode(ThemeMode.dark),
            preview: const _ThemePreview(dark: true),
          ),
          const SizedBox(height: 28),
          _SectionLabel(l10n.layout),
          const SizedBox(height: 12),
          _SelectableCard(
            title: l10n.leftToRight,
            selected: !localeC.isRtl,
            onTap: () => localeC.setEnglish(),
            preview: const _LayoutPreview(rtl: false),
          ),
          const SizedBox(height: 16),
          _SelectableCard(
            title: l10n.rightToLeft,
            selected: localeC.isRtl,
            onTap: () => localeC.setArabic(),
            preview: const _LayoutPreview(rtl: true),
          ),
        ],
      ),
    );
  }
}

// ─── Section label ───────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppTheme.of(context).text.main,
      ),
    );
  }
}

// ─── Selectable card ─────────────────────────────────────────────────────────

class _SelectableCard extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final Widget preview;

  const _SelectableCard({
    required this.title,
    required this.selected,
    required this.onTap,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppTheme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: t.background.shade200,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? t.accent.main!
                : t.lightGrey.main!.withValues(alpha: 0.5),
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: t.text.shade800,
                    ),
                  ),
                ),
                _SelectDot(selected: selected),
              ],
            ),
            const SizedBox(height: 16),
            preview,
          ],
        ),
      ),
    );
  }
}

class _SelectDot extends StatelessWidget {
  final bool selected;
  const _SelectDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    final t = AppTheme.of(context);
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? t.primary.main : Colors.transparent,
        border: selected
            ? null
            : Border.all(color: t.lightGrey.main!, width: 1.5),
      ),
      child: selected ? Icon(Icons.check, size: 16, color: t.white) : null,
    );
  }
}

// ─── Previews ────────────────────────────────────────────────────────────────
// Theme previews are hardcoded to their own palette so the "Dark" card still
// looks dark while the app is in light mode, and vice-versa.

class _ThemePreview extends StatelessWidget {
  final bool dark;
  const _ThemePreview({required this.dark});

  @override
  Widget build(BuildContext context) {
    final surface = dark ? const Color(0xFF1A1815) : const Color(0xFFEDE7DB);
    final block = dark ? const Color(0xFF2A241C) : const Color(0xFFFBF8F1);

    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _block(block, 46, 46),
          const SizedBox(width: 14),
          _block(block, 60, 68),
          const SizedBox(width: 14),
          _block(block, 46, 46),
        ],
      ),
    );
  }

  Widget _block(Color c, double w, double h) => Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

class _LayoutPreview extends StatelessWidget {
  final bool rtl;
  const _LayoutPreview({required this.rtl});

  @override
  Widget build(BuildContext context) {
    final t = AppTheme.of(context);
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: t.background.main,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Directionality(
        textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: t.background.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _line(t, 1.0),
                  const SizedBox(height: 10),
                  _line(t, 0.9),
                  const SizedBox(height: 10),
                  _line(t, 0.95),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _line(AppCoreTheme t, double widthFactor) => FractionallySizedBox(
    widthFactor: widthFactor,
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      height: 5,
      decoration: BoxDecoration(
        color: t.lightGrey.main,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

