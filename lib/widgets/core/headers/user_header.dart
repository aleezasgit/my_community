import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/statics/app_statics.dart';
import 'package:my_community/widgets/app_text_logo.dart';


class UserHeader extends StatelessWidget {
  final VoidCallback? onTapSettings;
  final VoidCallback? onTapMessages;
  final VoidCallback? onTapNotifications;
  final bool hasHorizontalPadding;

  /// Number shown in the red bubble on the bell. Hidden when null or <= 0.
  final int? notificationCount;

  /// Shows a small dot on the messages button (e.g. unread messages).
  final bool hasUnreadMessages;

  final double? logoSize;

  const UserHeader({
    super.key,
    this.onTapSettings,
    this.onTapMessages,
    this.onTapNotifications,
    this.hasHorizontalPadding = false,
    this.notificationCount,
    this.hasUnreadMessages = false,
    this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasHorizontalPadding ? Space.hf(16) : Space.hf(0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Transform.flip(
                  flipX: Directionality.of(context) == TextDirection.rtl,
                  child: SvgPicture.asset(
                    AppStaticData.backArrow,
                    colorFilter: ColorFilter.mode(
                      AppTheme.of(context).text.shade800!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              AppTextLogo(size: logoSize),
              const Spacer(),
              _ActionButton(
                assetPath: 'assets/svgs/setting-2.svg',
                onTap: onTapSettings,
              ),
              Space.xf(10),
              _ActionButton(
                assetPath: 'assets/svgs/message-notif.svg',
                onTap: onTapMessages,
                showDot: hasUnreadMessages,
              ),
              Space.xf(10),
              _ActionButton(
                assetPath: 'assets/svgs/notification.svg',
                onTap: onTapNotifications,
                badgeCount: notificationCount,
              ),
            ],
          ),
          Space.yf(12),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback? onTap;
  final int? badgeCount;
  final bool showDot;
  final double? iconSize;

  const _ActionButton({
    required this.assetPath,
    this.onTap,
    this.badgeCount,
    this.showDot = false,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool showBadge = badgeCount != null && badgeCount! > 0;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: AppTheme.of(context).background.shade200,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              assetPath,
              width: iconSize ?? 20.w,
              height: iconSize ?? 20.h,
              colorFilter: ColorFilter.mode(
                AppTheme.of(context).text.shade800!,
                BlendMode.srcIn,
              ),
            ),
          ),

          // Red count badge (bell)
          if (showBadge)
            PositionedDirectional(
              top: -4.h,
              end: -4.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                constraints: BoxConstraints(minWidth: 18.w, minHeight: 18.h),
                decoration: BoxDecoration(
                  color:
                      AppTheme.of(context).error.main ??
                      const Color(0xFFE5484D),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppTheme.of(context).background.main!,
                    width: 1.5.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  badgeCount! > 99 ? '99+' : '$badgeCount',
                  style: AppText.l1bm!.copyWith(
                    color: AppTheme.of(context).white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),

          // Small unread dot (messages)
          if (showDot && !showBadge)
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Container(
                width: 9.w,
                height: 9.w,
                decoration: BoxDecoration(
                  color:
                      AppTheme.of(context).error.main ??
                      const Color(0xFFE5484D),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.of(context).background.main!,
                    width: 1.5.w,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}