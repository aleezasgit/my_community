import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class NewsArticleCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;
  final List<String> hashtags;
  final String badgeText;
  final VoidCallback? onTap;

  const NewsArticleCard({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
    required this.hashtags,
    this.badgeText = 'Top',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.isDark(context);
    final Color cardBg = AppTheme.of(context).background.shade200!;
    // final Color innerTagBg = isDark 
    //     ? AppTheme.of(context).background.shade100! 
    //     : const Color(0xFFF6F3EC); // Soft ivory tint matching mockup layout surface

    return GestureDetector(
      onTap: onTap,
      //behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        padding: Space.all( 16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Top Display Area: Main Graphic Frame Banner ────────────────
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 177.h,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Overlay Top Badge Positioned Frame
                Positioned(
                  top: 12.h,
                  left: 8.w,
                  child: Container(
                    padding: Space.all(12,6),
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).background.main!,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      badgeText,
                      style: AppText.l1bm!.cl(AppTheme.of(context).text.shade800!),
                    ),
                  ),
                ),
              ],
            ),

            Space.yf(10),

            // ─── Title Content Typography Segment ───────────────────────────
            Text(
              title,
              style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!,
                  ),
            ),

            Space.yf(10),

            // ─── Body Text Information Segment ──────────────────────────────
            Text(
              content,
              style: AppText.l1!.cl(AppTheme.of(context).text.main!
                   
                  ),
            ),

            Space.yf(16),

            // ─── Thin Custom Divider Partition Grid Line ───────────────────
            Container(
              width: double.infinity,
              height: 1.h,
              color: 
                   AppTheme.of(context).primary.shade300! 
                 
            ),

            Space.yf(10),

            // ─── Bottom Wrapping Flow Hashtags Segment ──────────────────────
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: hashtags.map((tag) {
                // Ensure strings always prefix the '#' sign correctly
                final cleanTag = tag.startsWith('#') ? tag : '#$tag';
                return Container(
                 padding: Space.all(12,4.5),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).background.main!,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    cleanTag,
                    style: AppText.l1bm!.cl(AppTheme.of(context).text.shade800!),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// 2. MAIN SCREEN ENTRY (Placed last)
// =============================================================================

class NewsCardScreen extends StatelessWidget {
  const NewsCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    // Dynamic mockup checklist definition data configuration profiles
    const String sampleTitle = 'How AI is transforming the future of remote work worldwide';
    const String sampleContent = 'Dive into the evolving landscape of artificial intelligence enhancing virtual collaboration. From smart assistants to predictive analytics, discover tools reshaping productivity and creativity in the digital age.';
    const List<String> sampleHashtags = [
      'AI', 
      'remotework', 
      'technology', 
      'futureofwork', 
      'innovation'
    ];

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Article Display',
          style: AppText.h6b!.cl(AppTheme.of(context).text.shade800!),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(16),

            // Customizable News Card initialization component hooks
            const NewsArticleCard(
              title: sampleTitle,
              content: sampleContent,
              imagePath: 'assets/pngs/Frame 2147229685.png',
              hashtags: sampleHashtags,
              badgeText: 'Top',
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}