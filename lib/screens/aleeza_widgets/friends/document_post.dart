import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Ensure this path exactly matches your config file location
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class DocumentModel {
  final String docName;
  final String docIndexLabel;

  const DocumentModel({
    required this.docName,
    required this.docIndexLabel,
  });
}

class DocumentPostCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String avatarPath;
  final List<DocumentModel> documents;
  final String captionUser;
  final String captionText;
  final int likesCount;
  final int commentsCount;
  final int bookmarksCount;
  final VoidCallback? onMoreTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onBookmarkTap;
  final Function(int)? onDownloadTap;
   final Function(bool)? onLikeToggle;

  const DocumentPostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.avatarPath,
    required this.documents,
    required this.captionUser,
    required this.captionText,
    required this.likesCount,
   
    required this.commentsCount,
    required this.bookmarksCount,
    this.onMoreTap,
    this.onLikeTap,
    this.onCommentTap,
    this.onBookmarkTap,
    this.onDownloadTap, this.onLikeToggle,
  });

  @override
  State<DocumentPostCard> createState() => _DocumentPostCardState();
}

class _DocumentPostCardState extends State<DocumentPostCard> {
  int _currentPage = 0;
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
          // ─── Header: User Profile Row (Exact Same) ─────────────────────────
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

          // ─── Middle: Document Carousel Box ─────────────────────────────────
          Container(
            width: double.infinity,
            height: 200.h, // Fixed height to encapsulate the swipable content safely
            decoration: BoxDecoration(
              color: AppTheme.of(context).background.shade200!,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: widget.documents.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final doc = widget.documents[index];
                      return Padding(
                        padding: Space.only(left:12, right:12, top: 12,),
                        child: Column(
                          children: [
                            // Page indicator text (e.g., 1/3)
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                doc.docIndexLabel,
                                style: AppText.l1bm!.cl(AppTheme.of(context).text.shade600!),
                              ),
                            ),
                            
                            // PDF Icon Graphic Box
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: AppTheme.of(context).background.main!,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            // padding: Space.all(15),
                              child: SvgPicture.asset(
                                'assets/svgs/pdf.svg',
                                
                                //fit: BoxFit.contain,
                              ),
                            ),
                            
                            Space.yf(10),
                            
                            // Document filename typography string
                            Text(
                              doc.docName,
                              style: AppText.b1!.cl(AppTheme.of(context).text.shade800!),
                              textAlign: TextAlign.center,
                            ),
                            
                            Space.yf(16),
                            
                            // Action Button Controller: Download Button
                            GestureDetector(
                              onTap: () => widget.onDownloadTap?.call(index),
                              child: Container(
                               padding: Space.all(12,8),
                                decoration: BoxDecoration(
                                  color: AppTheme.of(context).accent.main!,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svgs/document-download.svg',
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                                    Space.xf(2),
                                    Text(
                                      'Download',
                                      style: AppText.l1b!.cl(AppTheme.of(context).white!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Space.yf(10),
                // Slider dots indicator pagination mockup graphic line representation
                Padding(
                  padding: Space.only(bottom:10, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.documents.length,
                      (index) => AnimatedContainer(
                        duration: UIProps.duration0,
                        margin: Space.hf(3),
                        width: 4.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? AppTheme.of(context).primary.main!
                              : AppTheme.of(context).lightGrey.main!,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Space.yf(10),

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
              // Like Action Component (Clickable Toggle)
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

class DocumentPostScreen extends StatelessWidget {
  const DocumentPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    // Mocking a multi-document list array payload
    final mockDocuments = [
      const DocumentModel(docName: 'Document.pdf', docIndexLabel: '1/3'),
      const DocumentModel(docName: 'Assignment_Guidelines.pdf', docIndexLabel: '2/3'),
      const DocumentModel(docName: 'Project_Ramp.pdf', docIndexLabel: '3/3'),
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

            // Carousel Document Card implementation hook
            DocumentPostCard(
              username: 'Kairo',
              timeAgo: '5 Hours ago',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              documents: mockDocuments,
              captionUser: 'graffiexplorer',
              captionText: 'Exploring hidden murals that tell stories of the city\'s soul.',
              likesCount: 60,
              commentsCount: 15,
              bookmarksCount: 7,
              onMoreTap: () => debugPrint('More options pressed'),
              onLikeTap: () => debugPrint('Like pressed'),
              onCommentTap: () => debugPrint('Comment pressed'),
              onBookmarkTap: () => debugPrint('Bookmark pressed'),
              onDownloadTap: (index) => debugPrint('Download triggered for file index: $index'),
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}