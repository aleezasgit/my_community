import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class MemberTile extends StatelessWidget {
  final String name;
  final String joinedDuration;
  final String avatarPath;
  final VoidCallback? onMessageTap;

  const MemberTile({
    super.key,
    required this.name,
    required this.joinedDuration,
    required this.avatarPath,
    this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;
    final Color innerIconBg =
         AppTheme.of(context).background.shade200!;
        

    return Container(
      width: double.infinity,
      padding: Space.all(12, 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // ─── Left Side: Profile Picture Avatar ───
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              avatarPath,
              width: 46.w,
              height: 46.h,
              fit: BoxFit.cover,
            ),
          ),
          Space.xf(16),

          // ─── Middle Section: Text Descriptors metadata block ───
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                ),
                Space.yf(1),
                Text(
                  'Joined $joinedDuration ago',
                  style: AppText.b1!.cl(AppTheme.of(context).text.main!),
                ),
              ],
            ),
          ),

          // ─── Right Side: Svg Messaging Shortcut Widget Box ───
          GestureDetector(
            onTap: onMessageTap,
            child: Container(
             // width: 40.w,
              //height: 32.h,
              decoration: BoxDecoration(
                color: innerIconBg,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppTheme.of(context).primary.shade300!,
                  width: 1.w,
                ),
              ),
              padding: Space.all(12,8),
              child: SvgPicture.asset(
                height: 16.h,
                width: 16.w,
                'assets/svgs/message-text.svg', // Matches your project mockup icon reference
               
              ),
            ),
          ),
        ],
      ),
    );
  }
}