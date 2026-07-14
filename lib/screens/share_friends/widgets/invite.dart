import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class InviteTile extends StatelessWidget {
  final String name;
  final String joinedDuration;
  final String avatarPath;
  final VoidCallback? onMessageTap;
  final VoidCallback? onInviteTap; // 🚀 Added: Optional callback for the Invite action

  const InviteTile({
    super.key,
    required this.name,
    required this.joinedDuration,
    required this.avatarPath,
    this.onMessageTap,
    this.onInviteTap, // 🚀 Added
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;
    final Color innerIconBg = AppTheme.of(context).background.shade200!;

    return Container(
      width: double.infinity,
      padding: Space.all(12, 12), // 🎯 Kept original padding
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r), // 🎯 Kept original radius
      ),
      child: Row(
        children: [
          // ─── Left Side: Profile Picture Avatar ───
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r), // 🎯 Kept original avatar radius
            child: Image.asset(
              avatarPath,
              width: 46.w,   // 🎯 Kept original width
              height: 46.h,  // 🎯 Kept original height
              fit: BoxFit.cover,
            ),
          ),
          Space.xf(16), // 🎯 Kept original gap

          // ─── Middle Section: Text Descriptors ───
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!), // 🎯 Kept original text style
                ),
                Space.yf(4), // 🎯 Kept original vertical gap
                Text(
                  'Joined $joinedDuration ago',
                  style: AppText.b1!.cl(AppTheme.of(context).text.main!), // 🎯 Kept original text style
                ),
              ],
            ),
          ),

          // ─── Right Side: Message Action OR Invite Action ───
          if (onInviteTap != null) ...[
            // 🚀 Added: Invite Button layout (Matches terracotta theme)
            GestureDetector(
              onTap: onInviteTap,
              child: Container(
                padding: Space.all(12, 8),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).accent.main, // Terracotta background from mockup
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/addwhite.svg', // 🎯 SVG icon for the "+" symbol
                      width: 16.w,
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    Space.xf(2),
                    Text(
                      'Invite',
                      style: AppText.l1b!.cl(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            // 🎯 Kept original Message Action layout untouched
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
                padding: Space.all(12, 8), // 🎯 Kept original interior padding
                child: SvgPicture.asset(
                  'assets/svgs/message-text.svg', // 🎯 Kept original svg reference
                  height: 16.h,
                  width: 16.w,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}