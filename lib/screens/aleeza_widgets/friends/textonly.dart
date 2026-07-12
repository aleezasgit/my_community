import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class TextPostCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final String textContent;
  final int likesCount;
  final int commentsCount;
  final int bookmarksCount;
  final VoidCallback? onMoreTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onBookmarkTap;
  final Function(bool)? onLikeToggle;

  const TextPostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.textContent,
    required this.likesCount,
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onLikeToggle,
  });

  @override
  State<TextPostCard> createState() => _TextPostCardState();
}

class _TextPostCardState extends State<TextPostCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.main!;

    return Container(
      width: double.infinity,
      //padding: Space.all(12, 16),
      decoration: BoxDecoration(
        color: cardBg,
        //: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header: User Profile Row (Exact Same Template) ────────────────
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  widget.avatarPath,
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
                      widget.username,
                      style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!),
                    ),
                    Space.yf(2),
                    Text(
                      widget.timeAgo,
                      style: AppText.l1!.cl(AppTheme.of(context).text.main!),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.onMoreTap,
                child: SvgPicture.asset(
                  'assets/svgs/three_dots.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),

          Space.yf(15),

          // ─── Middle: Text Content Bubble Frame ─────────────────────────────
          Container(
            width: double.infinity,
            padding: Space.only(top: 12, bottom: 35, left: 12, right: 26),
            decoration: BoxDecoration(
              color: AppTheme.of(context).background.shade200!,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              widget.textContent,
              style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
              // .copyWith(
              //       height: 1.5, // Matches mockup paragraph paragraph spacing guidelines
              //     ),
            ),
          ),

          Space.yf(12),

          // ─── Bottom: Interaction Utility Bar (SVGs with State Toggle) ──────
          Row(
            children: [
              // Like Action Component
              GestureDetector(
                onTap: () {
                  setState(() => _isLiked = !_isLiked);
                  widget.onLikeToggle?.call(_isLiked);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: UIProps.duration0,
                      child: SvgPicture.asset(
                        _isLiked ? 'assets/svgs/heart.svg' : 'assets/svgs/Iconly.svg',
                        key: ValueKey<bool>(_isLiked),
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    Space.xf(4),
                    Text(
                      '${widget.likesCount + (_isLiked ? 1 : 0)}',
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ),
              Space.xf(24),

              // Comment Action Component
              GestureDetector(
                onTap: widget.onCommentTap,
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
                      '${widget.commentsCount}',
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ),
              Space.xf(24),

              // Bookmark Action Component
              GestureDetector(
                onTap: widget.onBookmarkTap,
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
                      '${widget.bookmarksCount}',
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

class TextPostScreen extends StatelessWidget {
  const TextPostScreen({super.key});

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

            // Displaying the static Text Only Card component
            TextPostCard(
              username: 'Kairo (You)',
              timeAgo: '5 Hours ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              textContent: 'Discover the vibrant world of hidden murals that reveal the heart and soul of the city. Each artwork is a zesty flatlay, bursting with colors and stories that invite you to explore deeper. Join us on this artistic journey and shine a \'lime-light\' on the creativity that surrounds us!',
              likesCount: 60,
              commentsCount: 15,
              bookmarksCount: 7,
              onMoreTap: () => debugPrint('More options pressed'),
              onCommentTap: () => debugPrint('Comment pressed'),
              onBookmarkTap: () => debugPrint('Bookmark pressed'),
              onLikeToggle: (isLiked) => debugPrint('Like toggled state: $isLiked'),
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}