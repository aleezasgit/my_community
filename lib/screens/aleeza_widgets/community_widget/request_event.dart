import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';

class RequestEvent extends StatelessWidget {
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
  final VoidCallback? onDeclineTap;
  final VoidCallback? onAcceptTap;
  final VoidCallback? onCardTap;

  const RequestEvent({
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
    this.onDeclineTap,
    this.onAcceptTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;

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
            // ─── Header Section: Requester Info ─────────────────────────────
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    organizerAvatarPath,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Space.xf(10),
                Expanded(
                  child: Text(
                    '$organizerName is requesting you to join this Event',
                    style: AppText.b2!.cl(AppTheme.of(context).text.shade800!),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            Space.yf(10),

            // ─── Stack Section: Banner Image with Text Overlays ─────────────
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    bannerImagePath,
                    width: double.infinity,
                    height: 164.h,
                    fit: BoxFit.cover,
                  ),
                ),
                // Dark translucent overlay for typography readability
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
               
                    ),
                  ),
                ),
                // Text Metadata Positioning Layout Over Banner
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 16.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        eventTitle,
                        style: AppText.b1b!.cl(Colors.white),
                      ),
                      Space.yf(12),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/clock.svg',
                                width: 20.w,
                                height: 20.h,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              Space.xf(4),
                              Text(
                                eventTime,
                                style: AppText.l1!.cl(Colors.white),
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
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              Space.xf(4),
                              Text(
                                location,
                                style: AppText.l1!.cl(Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Space.yf(10),

            // ─── Actions Grid: Decline & Accept Row Split ────────────────────
           Align(
            alignment: Alignment.centerRight,
             child: Container(
              width: 174.w,
               child: Row(
               // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
                          
                          children: [
                            // Decline Button
                                        Expanded(
                        child: AppButton(label: "Decline", 
                        iconPath: "assets/svgs/cross.svg",
                        iconColor: AppTheme.of(context).background.shade800,
                        buttonType: ButtonType.outlined,
                        borderColor: AppTheme.of(context).primary.shade300,
                        onPressed: (){},
                        backgroundColor: AppTheme.of(context).background.shade200,
                        textColor: AppTheme.of(context).text.shade800,
                        
                        
                        ),
                                        ),
                            Space.xf(10),
                        
                           
                              Expanded(
                                child: AppButton(label: "Accept",
                                buttonType: ButtonType.outlinedWithIconLeft,
                                iconPath: "assets/svgs/tick-circle.svg",
                                iconColor: AppTheme.of(context).background.shade200, 
                                                onPressed: (){},
                                                backgroundColor: AppTheme.of(context).accent.main,
                                                textColor: AppTheme.of(context).background.shade200,
                                                
                                
                                                ),
                              ),
                          ],
                        ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}