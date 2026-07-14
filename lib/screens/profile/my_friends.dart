import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

enum MemberTileType { friend, request }

class FriendsTile extends StatelessWidget {
  final String name;
  final String joinedDuration;
  final String avatarPath;
  final MemberTileType type; // 🚀 Added: Switcher to toggling layout properties
  final VoidCallback? onMessageTap;
  final VoidCallback? onPrimaryActionTap;   // 🚀 Added: Acts as "Unfriend" or "Accept"
  final VoidCallback? onSecondaryActionTap; // 🚀 Added: Acts as "Decline" (For requests)

  const FriendsTile({
    super.key,
    required this.name,
    required this.joinedDuration,
    required this.avatarPath,
    this.type = MemberTileType.friend,
    this.onMessageTap,
    this.onPrimaryActionTap,
    this.onSecondaryActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;
    final Color innerIconBg = AppTheme.of(context).background.shade200!;
    final Color strokeColor = const Color(0xFFE2DDD3);

    return Container(
      width: double.infinity,
      padding: Space.all(12, 12), // 🎯 Kept exact original padding
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r), // 🎯 Kept exact original radius
      ),
      child: Row(
        children: [
          // ─── Left Side: Profile Picture Avatar ───
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r), // 🎯 Kept exact original avatar style
            child: Image.asset(
              avatarPath,
              width: 46.w,   // 🎯 Kept exact original dimensions
              height: 46.h,  // 🎯 Kept exact original dimensions
              fit: BoxFit.cover,
            ),
          ),
          Space.xf(16), // 🎯 Kept exact original horizontal gap

          // ─── Middle Section: Text Descriptors metadata block ───
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!), // 🎯 Kept exact original text style
                ),
                Space.yf(4), // 🎯 Kept exact original vertical gap
                Text(
                  'Joined $joinedDuration ago',
                  style: AppText.b1!.cl(AppTheme.of(context).text.main!), // 🎯 Kept exact original text style
                ),
              ],
            ),
          ),

          Space.xf(8), // 🎯 Clean spacing buffer before the button actions

          // ─── Right Side: Context-dependent Buttons ───
          if (type == MemberTileType.friend) ...[
            // Added: Unfriend button exactly sized matching your mockup
            GestureDetector(
              onTap: onPrimaryActionTap,
              child: Container(
               padding: Space.all(12,8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppTheme.of(context).primary.shade300!, width: 1.w),
                ),
                child: Text(
                  'Unfriend',
                  style: AppText.l1b!.cl(AppTheme.of(context).text.shade800!),
                ),
              ),
            ),
            Space.xf(6),

            //  Kept exact original Message Action button block
            GestureDetector(
              onTap: onMessageTap,
              child: Container(
                decoration: BoxDecoration(
                  color: innerIconBg,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppTheme.of(context).primary.shade300!,
                    width: 1.w,
                  ),
                ),
                padding: Space.all(12, 8), // 🎯 Kept exact original internal icon padding
                child: SvgPicture.asset(
                  'assets/svgs/message-text.svg', // 🎯 Kept exact original svg reference path
                  height: 16.h,
                  width: 16.w,
                ),
              ),
            ),
          ] else ...[
            // 🚀 Added: Decline Button (Requests Mode)
            GestureDetector(
              onTap: onSecondaryActionTap,
              child: Container(
            //    padding: Space.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: strokeColor, width: 1.w),
                ),
                child: Text(
                  'Decline',
                  style: AppText.b2b!.cl(AppTheme.of(context).text.main!),
                ),
              ),
            ),
            Space.xf(8),

            // 🚀 Added: Accept Button (Requests Mode)
            GestureDetector(
              onTap: onPrimaryActionTap,
              child: Container(
              //  padding: Space.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF566B4D), // Soft Sage Accent fill color
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Accept',
                  style: AppText.b2b!.cl(Colors.white),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}