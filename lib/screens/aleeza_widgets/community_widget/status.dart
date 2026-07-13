import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class CommunityStatsCard extends StatelessWidget {
  final String communityName;
  final String creatorName;
  final String avatarPath;
  final int badgeCount;
  final int friendsCount;
  final String totalMembers;
  final String totalPosts;
  final String createdYear;

  const CommunityStatsCard({
    super.key,
    required this.communityName,
    required this.creatorName,
    required this.avatarPath,
    required this.badgeCount,
    required this.friendsCount,
    required this.totalMembers,
    required this.totalPosts,
    required this.createdYear,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;
    final Color statsBg = 
        AppTheme.of(context).background.main!
        ;

    return Container(
      width: double.infinity,
      padding: Space.all(12,),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Top Metadata Segment: Avatar Stack & Identity Summary ───
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack Layout structure layering circular badge cleanly over bottom-right profile frame corner
              Stack(
               clipBehavior:Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      avatarPath,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (badgeCount > 0)
                    Positioned(
                      bottom: -4.h,
                      right: -6.w,
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                      //  padding: Space.all(4, 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF3B30), // Active warning red indicator tone
                          shape: BoxShape.circle,
                        ),
                        // constraints: BoxConstraints(
                        //   minWidth: 20.w,
                        //   minHeight: 20.h,
                        // ),
                        child: Center(
                          child: Text(
                            '$badgeCount',
                            style: AppText.l2b!.cl(Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Space.xf(16),

              // Name Titles Meta Block
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      communityName,
                      style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                    ),
                    Space.yf(4),
                    Text(
                      'By $creatorName',
                      style: AppText.b2!  .cl(AppTheme.of(context).text.main!),
                    ),
                  ],
                ),
              ),

              // Friends Count Chip Badge Container Frame
              Container(
                padding: Space.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).background.main!,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/eye.svg',
                      width: 12.w,
                      height: 12.h,
                     
                    ),
                    Space.xf(4),
                    Text(
                      '$friendsCount Friends',
                      style: AppText.l2bm!.cl(AppTheme.of(context).accent.main!),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Space.yf(16),

          // ─── Bottom Grid Grid Matrix Block: Dynamic Metric Box Rows ───
          Container(
            width: double.infinity,
            padding: Space.all(10),
            decoration: BoxDecoration(
              color: statsBg,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Members', totalMembers, context),
                _buildStatItem('Total Posts', totalPosts, context),
                _buildStatItem('Created Year', createdYear, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
        ),
        Space.yf(4),
        Text(
          label,
          style: AppText.l1!.cl(AppTheme.of(context).text.main!),
        ),
      ],
    );
  }
}