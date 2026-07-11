import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class DocumentPostCard extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final String docName;
  final String docIndexLabel; // e.g., "1/3"
  final String captionUser;
  final String captionText;
  final int likesCount;
  final int commentsCount;
  final int bookmarksCount;
  final VoidCallback? onMoreTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onDownloadTap;

  const DocumentPostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.docName,
    required this.docIndexLabel,
    required this.captionUser,
    required this.captionText,
    required this.likesCount,
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onDownloadTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header: User Profile Row (Exact Same) ─────────────────────────
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  avatarPath,
                  width: 46.w,
                  height: 46.h,
                ),
              ),
              Space.xf(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!),
                    ),
                    Space.yf(2),
                    Text(
                      timeAgo,
                      style: AppText.l1!.cl(AppTheme.of(context).text.main!),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onMoreTap,
                child: SvgPicture.asset(
                  'assets/svgs/three_dots.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),

          Space.yf(12),

          // ─── Middle: Document Presentation Preview Box ─────────────────────
          Container(
            width: double.infinity,
            padding: Space.all(16, 16),
            decoration: BoxDecoration(
              color: AppTheme.of(context).background.shade100!,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              children: [
                // Page indicator label text alignment block (e.g. 1/3)
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    docIndexLabel,
                    style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                  ),
                ),
                
                // PDF Icon Graphic Box
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).background.shade200!,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: Space.all(12),
                  child: SvgPicture.asset(
                    'assets/svgs/pdf_icon.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                
                Space.yf(12),
                
                // Document filename typography string
                Text(
                  docName,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                  textAlign: TextAlign.center,
                ),
                
                Space.yf(16),
                
                // Action Button Controller: Download Action Block Button
                GestureDetector(
                  onTap: onDownloadTap,
                  child: Container(
                   // padding: Space.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).accent.main!,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/download_icon.svg',
                          width: 14.w,
                          height: 14.h,
                        ),
                        Space.xf(6),
                        Text(
                          'Download',
                          style: AppText.b2b!.cl(AppTheme.of(context).white!),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Space.yf(8),
                
                // Slider dots indicator pagination mockup graphic line representation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.of(context).primary.main!,
                      ),
                    ),
                    Space.xf(4),
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.of(context).lightGrey.main!,
                      ),
                    ),
                    Space.xf(4),
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.of(context).lightGrey.main!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Space.yf(12),

          // ─── Caption Section ───────────────────────────────────────────────
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$captionUser ',
                  style: AppText.l1b!.cl(AppTheme.of(context).text.shade600!),
                ),
                TextSpan(
                  text: captionText,
                  style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                ),
              ],
            ),
          ),

          Space.yf(12),

          // ─── Bottom: Interaction Utility Bar (SVGs) ───────────────────────
          Row(
            children: [
              // Like Action Component
              GestureDetector(
                onTap: onLikeTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/heart.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      '$likesCount',
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ),
              Space.xf(24),

              // Comment Action Component
              GestureDetector(
                onTap: onCommentTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/Chat.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      '$commentsCount',
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ),
              Space.xf(24),

              // Bookmark Action Component
              GestureDetector(
                onTap: onBookmarkTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/bookmark.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      '$bookmarksCount',
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 2. MAIN SCREEN ENTRY (Placed last)
// =============================================================================

class DocumentPostScreen extends StatelessWidget {
  const DocumentPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Feed Testing',
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

            // Displaying the static Document Post Component with Mockup Values
            DocumentPostCard(
              username: 'Kairo',
              timeAgo: '5 Hours ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png', // Main avatar matching layout profile
              docName: 'Document.pdf',
              docIndexLabel: '1/3',
              captionUser: 'graffiexplorer',
              captionText: 'Exploring hidden murals that tell stories of the city\'s soul.',
              likesCount: 60,
              commentsCount: 15,
              bookmarksCount: 7,
              onMoreTap: () => debugPrint('More options pressed'),
              onLikeTap: () => debugPrint('Like pressed'),
              onCommentTap: () => debugPrint('Comment pressed'),
              onBookmarkTap: () => debugPrint('Bookmark pressed'),
              onDownloadTap: () => debugPrint('Start document download trigger'),
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}