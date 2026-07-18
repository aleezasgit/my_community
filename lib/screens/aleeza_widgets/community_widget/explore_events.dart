
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class EventPostCard extends StatelessWidget {
  final String organizerName;
  final String timeAgo;
  final String organizerAvatarPath;
  final String eventTitle;
  final String eventDescription;
  final String bannerImagePath;
  final String eventDate; 
  final String eventTime; 
  final String location;  
  final List<String> attendeeAvatars; 
  final int additionalAttendeesCount; 
  final bool isJoined;
  final VoidCallback? onJoinTap;
  final VoidCallback? onCardTap;

  const EventPostCard({
    super.key,
    required this.organizerName,
    required this.timeAgo,
    required this.organizerAvatarPath,
    required this.eventTitle,
    required this.eventDescription,
    required this.bannerImagePath,
    required this.eventDate,
    required this.eventTime,
    required this.location,
    required this.attendeeAvatars,
    required this.additionalAttendeesCount,
    this.isJoined = true,
    this.onJoinTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;
    final Color strokeColor = const Color(0xFFE2DDD3);

    return GestureDetector(
      onTap: onCardTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        padding: Space.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header: User Profile Row with Event Date ────────────────────
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    organizerAvatarPath,
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
                        organizerName,
                        style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                      ),
                      Space.yf(2),
                      Text(
                        timeAgo,
                        style: AppText.l1!.cl(AppTheme.of(context).text.main!),
                      ),
                    ],
                  ),
                ),
                
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/calendar.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      eventDate,
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade800!),
                    ),
                  ],
                ),
              ],
            ),

            Space.yf(12),

            // ─── Middle: Main Event Banner Image ─────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                bannerImagePath,
                width: double.infinity,
                height: 151.h,
                fit: BoxFit.cover,
              ),
            ),

            Space.yf(12),

            // ─── Event Title Heading ─────────────────────────────────────────
            Text(
              eventTitle,
              style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
            ),

            Space.yf(4),

            // ─── Event Brief Description Body ────────────────────────────────
            Text(
              eventDescription,
              style: AppText.l1!.cl(AppTheme.of(context).text.main!,
                  ),
            ),

            Space.yf(12),

            // ─── Metadata Strip: Time & Location Indicators ──────────────────
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/clock.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      eventTime,
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
                Space.xf(16),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/location.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                    Space.xf(4),
                    Text(
                      location,
                      style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                    ),
                  ],
                ),
              ],
            ),

            Space.yf(12),

            // ─── Attendees Overlap Stack List ────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (attendeeAvatars.isNotEmpty)
                  SizedBox(
                    width: (34 + (attendeeAvatars.length - 1) * 14).w,
                    height: 34.h,
                    child: Stack(
                      children: List.generate(
                        attendeeAvatars.length,
                        (index) => Positioned(
                          left: (index * 5).w,
                          child: Container(
                            decoration: BoxDecoration(
                           //   shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.of(context).background.shade200!, width: 1.w),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.asset(
                                attendeeAvatars[index],
                                width: 34.w,
                                height: 34.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
               // Space.xf(12),
                Text(
                  '+$additionalAttendeesCount people already joined',
                  style: AppText.l1!.cl(AppTheme.of(context).accent.main!), 
                ),
              ],
            ),

            Space.yf(12),

            // ─── Action Button Controller: Joined Button ─────────────────────
            GestureDetector(
              onTap: onJoinTap,
              child: Container(
                width: double.infinity,
               padding: Space.vf( 15.5),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).background.shade200,
                  borderRadius: BorderRadius.circular(16.r),
                  border:  Border.all(color: AppTheme.of(context).primary.shade300!, width: 1.w),
                ),
                child: Center(
                  child: Text(
                    isJoined ? 'Joined' : 'Join Event',
                    style: AppText.b1b!.cl(
                      AppTheme.of(context).text.shade800! ,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}