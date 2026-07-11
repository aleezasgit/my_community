import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class OwnPostSinglePhoto extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final String photoPath;
  final String captionUser;
  final String captionText;
  final int likesCount;
  final int commentsCount;
  final int bookmarksCount;
  final VoidCallback? onMoreTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onVideoPlayTap;

  const OwnPostSinglePhoto({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.photoPath,
    required this.captionUser,
    required this.captionText,
    required this.likesCount,
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onVideoPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;

    return Container(
      width: double.infinity,
    //  padding: Space.all(12, 16),
      decoration: BoxDecoration(
        color: cardBg,
       // borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header: User Profile Row ──────────────────────────────────────
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  avatarPath,
                  width: 46.w,
                  height: 46.h,
                 fit: BoxFit.cover,
                                 
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
               // behavior: HitTestBehavior.translucent,
                child: SvgPicture.asset(
                  'assets/svgs/three_dots.svg',
                  width: 20.w,
                  height: 20.h,
                 
                ),
              ),
            ],
          ),

          Space.yf(12),

          // ─── Middle: Video Thumbnail Preview Frame (PNG) ───────────────────
          GestureDetector(
            onTap: onVideoPlayTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    height: 177.h,
                    photoPath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    
                  ),
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

class OwnPostSinglePhotoScreen extends StatelessWidget {
  const OwnPostSinglePhotoScreen({super.key});

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

            // Displaying the static Video Post Component with Mockup Values
            OwnPostSinglePhoto(
              username: 'Kairo (You)',
              timeAgo: '53 Minutes ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              photoPath: 'assets/pngs/Rectangle 88.png',
              captionUser: 'graffiexplorer',
              captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
              likesCount: 45,
              commentsCount: 8,
              bookmarksCount: 12,
              onMoreTap: () => debugPrint('More pressed'),
              onLikeTap: () => debugPrint('Like pressed'),
              onCommentTap: () => debugPrint('Comment pressed'),
              onBookmarkTap: () => debugPrint('Bookmark pressed'),
              onVideoPlayTap: () => debugPrint('Video clicked to play/pause'),
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}