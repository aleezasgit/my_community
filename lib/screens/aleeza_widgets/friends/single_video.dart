import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class VideoPostCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final String videoThumbnailPath;
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
  final Function(bool)? onLikeToggle;

  const VideoPostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.videoThumbnailPath,
    required this.captionUser,
    required this.captionText,
    required this.likesCount,
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onVideoPlayTap, this.onLikeToggle,
  });

  @override
  _VideoPostCardState createState() => _VideoPostCardState();
}

class _VideoPostCardState extends State<VideoPostCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.main!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  widget.avatarPath,
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

          GestureDetector(
            onTap: widget.onVideoPlayTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    widget.videoThumbnailPath,
                    width: double.infinity,
                    height: 177.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.of(context).white!.withOpacity(0.5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/Polygon 1.svg',
                      width: 21.w,
                      height: 18.h,
                      colorFilter: ColorFilter.mode(
                        AppTheme.of(context).white!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Space.yf(12),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.captionUser} ',
                  style: AppText.l1b!.cl(AppTheme.of(context).text.shade600!),
                ),
                TextSpan(
                  text: widget.captionText,
                  style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                ),
              ],
            ),
          ),

          Space.yf(12),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() => _isLiked = !_isLiked);
                  widget.onLikeTap?.call();
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

class SingleVideo extends StatelessWidget {
  const SingleVideo({super.key});

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
            VideoPostCard(
              username: 'Borealis',
              timeAgo: '30 Minutes ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              videoThumbnailPath: 'assets/pngs/Rectangle 88.png',
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