part of '../onboarding.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final PageController _pageController;
  int _currentIndex = 0;
  late List<Map<String, String>> _pages;

  bool get _isLast => _currentIndex == _pages.length - 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Rebuilds when the locale changes (registers a Localizations dependency).
    _pages = onboardingPages(
      AppLocalizations.of(context),
      isDark: AppTheme.isDark(context),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (!_isLast) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      AppRoutes.createAccount.push(context);
    }
  }

  void _skip() {
    AppRoutes.createAccount.push(context);
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// Heading with the [highlight] word(s) in primary green, the rest in ink —
  /// matching the mixed-colour titles in the design.
  InlineSpan _buildTitleSpan(String title, String highlight) {
    final base = AppText.h2b!.copyWith(height: 1.06);

    if (highlight.isEmpty || !title.contains(highlight)) {
      return TextSpan(
        text: title,
        style: base.copyWith(color: AppTheme.of(context).text.shade700),
      );
    }

    final parts = title.split(highlight);
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(
          TextSpan(
            text: parts[i],
            style: base.copyWith(color: AppTheme.of(context).text.shade700),
          ),
        );
      }
      if (i < parts.length - 1) {
        spans.add(
          TextSpan(
            text: highlight,
            style: base.copyWith(color: AppTheme.of(context).primary.main),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }

  InlineSpan _buildSubtitleSpan(String subtitle) {
    const keyword = 'MogWars';
    final base = AppText.b2!.copyWith(
      color: AppTheme.of(context).text.main,
      height: 1.45,
    );

    if (!subtitle.contains(keyword)) {
      return TextSpan(text: subtitle, style: base);
    }

    final parts = subtitle.split(keyword);
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(text: parts[i], style: base));
      }
      if (i < parts.length - 1) {
        spans.add(
          TextSpan(
            text: keyword,
            style: base.copyWith(color: AppTheme.of(context).primary.main),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      body: SafeArea(
        child: Column(
          children: [
            /// ── HEADER: logo + Skip ─────────────────────────────────────
            Padding(
              padding: Space.hf(16).copyWith(top: 11.h, bottom: 22.h),
              child: Row(
                children: [
                  AppTextLogo(),
                  const Spacer(),
                  if (!_isLast)
                    GestureDetector(
                      onTap: _skip,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppTheme.of(context).lightGrey.main!,
                          ),
                        ),
                        child: Text(
                          l10n.skip,
                          style: AppText.l1bm!.copyWith(
                            color: AppTheme.of(context).text.shade700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// ── PAGE VIEW ───────────────────────────────────────────────
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  final item = _pages[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ── Image card (the "white container" = image) ──
                      Expanded(
                        child: Padding(
                          padding: Space.hf(16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).background.shade200,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.of(
                                    context,
                                  ).text.shade700!.withValues(alpha: 0.05),
                                  blurRadius: 24,
                                  offset: const Offset(0, 12),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 32.w),
                              child: Image.asset(
                                item['image']!,
                                width: 256.w,
                                height: 100.h,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Space.yf(18),

                      // ── Dots ──
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_pages.length, (i) {
                          final active = i == index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                            height: 6.h,
                            width: 6.w,
                            decoration: BoxDecoration(
                              color: active
                                  ? AppTheme.of(context).primary.main
                                  : AppTheme.of(context).background.shade200!,
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: !active
                                    ? AppTheme.of(context).lightGrey.main!
                                    : Colors.transparent,
                              ),
                            ),
                          );
                        }),
                      ),

                      Space.yf(28),

                      // ── Title ──
                      Padding(
                        padding: Space.hf(24),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: _buildTitleSpan(
                            item['title']!,
                            item['highlight']!,
                          ),
                        ),
                      ),

                      Space.yf(16),

                      // ── Subtitle ──
                      Padding(
                        padding: Space.hf(28),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: _buildSubtitleSpan(item['subtitle']!),
                        ),
                      ),

                      Space.yf(16),
                    ],
                  );
                },
              ),
            ),

            /// ── CTA BUTTON ──────────────────────────────────────────────
            Padding(
              padding: Space.hf(16).copyWith(top: 8.h, bottom: 16.h),
              child: AppButton(
                label: _isLast ? l10n.getStarted : l10n.continueLabel,
                onPressed: _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
