import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class FriendRequestTile extends StatelessWidget {
  final String name;
  final String joinedDuration;
  final String avatarPath;
  final VoidCallback? onAcceptTap;
  final VoidCallback? onDeclineTap;

  const FriendRequestTile({
    super.key,
    required this.name,
    required this.joinedDuration,
    required this.avatarPath,
    this.onAcceptTap,
    this.onDeclineTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;

    return Container(
      width: double.infinity,
      padding: Space.all(12, 12), // 🎯 Matches your exact MemberTile padding
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r), // 🎯 Matches your exact MemberTile radius
      ),
      child: Row(
        children: [
          // ─── Left Side: Profile Picture Avatar ───
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r), // 🎯 Matches your exact MemberTile avatar style
            child: Image.asset(
              avatarPath,
              width: 46.w,   // 🎯 Matches your exact MemberTile width
              height: 46.h,  // 🎯 Matches your exact MemberTile height
              fit: BoxFit.cover,
            ),
          ),
          Space.xf(16), // 🎯 Matches your exact MemberTile horizontal gap

          // ─── Middle Section: Text Descriptors ───
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!), // 🎯 Matches your exact MemberTile text style
                ),
                Space.yf(4), // 🎯 Matches your exact MemberTile vertical gap
                Text(
                  'Joined $joinedDuration ago',
                  style: AppText.b1!.cl(AppTheme.of(context).text.main!), // 🎯 Matches your exact MemberTile text style
                ),
              ],
            ),
          ),

          Space.xf(8), // Spacing buffer before actions

          // ─── Right Side: Square Decline (✕) and Accept (✓) Buttons ───
          
          // Decline Button (Square with border)
          GestureDetector(
            onTap: onDeclineTap,
            child: Container(
              width: 34.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppTheme.of(context).primary.shade300!, // Light pastel border
                  width: 1.w,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svgs/cross.svg",
                  width: 16.w,
                  height: 16.h,
                //  color: AppTheme.of(context).primary.shade300!, // Light pastel icon color
                ),
              ),
            ),
          ),
          Space.xf(6),

          // Accept Button (Solid terracotta container)
          GestureDetector(
            onTap: onAcceptTap,
            child: Container(
              width: 34.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppTheme.of(context).accent.main, // Terracotta theme background color
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svgs/tick.svg",
                  width: 16.w,
                  height: 16.h,
                //  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}