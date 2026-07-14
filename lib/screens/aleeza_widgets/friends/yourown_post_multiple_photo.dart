import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class PhotoPostCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final List<String> imagePaths; // Supports a carousel list of photos
  final String captionUser;
  final String captionText;
  final int likesCount;
  final int commentsCount;
  final int bookmarksCount;
  final VoidCallback? onMoreTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onBookmarkTap;
  final Function(bool)? onLikeToggle;

  const PhotoPostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.imagePaths,
    required this.captionUser,
    required this.captionText,
    required this.likesCount,
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onLikeToggle,
  });

  @override
  State<PhotoPostCard> createState() => _PhotoPostCardState();
}

class _PhotoPostCardState extends State<PhotoPostCard> {
  int _currentPage = 0;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.main!;

    return Container(
      width: double.infinity,
     // padding: Space.all(12, 16),
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

          // ─── Middle: Photo Carousel Box ────────────────────────────────────
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 177.h, // Extended viewport safety layer matching document card specifications
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16.r),
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: PageView.builder(
                    itemCount: widget.imagePaths.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.imagePaths[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),

              // Mockup Pagination Label Layer (e.g., 1/8)
              if (widget.imagePaths.length > 1)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Text(
                    '${_currentPage + 1}/${widget.imagePaths.length}',
                    style: AppText.l2!.cl(AppTheme.of(context).white!),
                  ),
                ),

              // Carousel Dots Indicator Layer
              if (widget.imagePaths.length > 1)
                Positioned(
                  bottom: 12.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imagePaths.length,
                      (index) => AnimatedContainer(
                        duration: UIProps.duration0,
                        margin: Space.hf(1.5),
                        width: 4.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? const Color(0xFF566B4D) // Sage active dot selection indicator 
                              : AppTheme.of(context).white!.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Space.yf(12),

          // ─── Caption Section ───────────────────────────────────────────────
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

          // ─── Bottom: Interaction Utility Bar (SVGs) ───────────────────────
          Row(
            children: [
              // Like Action Component (Interactive Toggle Switch)
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

class PhotoPostScreen extends StatelessWidget {
  const PhotoPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    // Mocking an 8-photo carousel asset payload sequence
    final mockPhotos = [
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Rectangle 88.png',
    ];

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

            // Carousel Image Multi-Photo Card implementation hook
            PhotoPostCard(
              username: 'Noam Laish',
              timeAgo: '5 Hours ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              imagePaths: mockPhotos,
              captionUser: 'graffiexplorer',
              captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
              likesCount: 60,
              commentsCount: 15,
              bookmarksCount: 7,
              onMoreTap: () => debugPrint('More options pressed'),
              onCommentTap: () => debugPrint('Comment pressed'),
              onBookmarkTap: () => debugPrint('Bookmark pressed'),
              onLikeToggle: (isLiked) => debugPrint('Liked status updated to: $isLiked'),
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}