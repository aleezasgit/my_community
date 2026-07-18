part of '../notification.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final theme = AppTheme.of(context);
    final Color sectionHeaderColor = theme.text.shade800!;

    return Scaffold(
      backgroundColor: theme.background.main,
      
      // ─── 1. Custom Centered App Bar ───
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Notifications',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(16),

            // ─── Today Section ───
            if (state.localTodayNotifications.isNotEmpty) ...[
              Text(
                'Today',
                style: AppText.b1b!.cl(sectionHeaderColor),
              ),
              Space.yf(10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.localTodayNotifications.length,
                separatorBuilder: (context, index) => Space.yf(10)!,
                itemBuilder: (context, index) {
                  final item = state.localTodayNotifications[index];
                  return _buildNotificationCard(context, item, state, true);
                },
              ),
              Space.yf(20),
            ],

            // ─── Yesterday Section ───
            if (state.localYesterdayNotifications.isNotEmpty) ...[
              Text(
                'Yesterday',
                style: AppText.b1b!.cl(sectionHeaderColor),
              ),
              Space.yf(10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.localYesterdayNotifications.length,
                separatorBuilder: (context, index) => Space.yf(10),
                itemBuilder: (context, index) {
                  final item = state.localYesterdayNotifications[index];
                  return _buildNotificationCard(context, item, state, false);
                },
              ),
              Space.yf(32),
            ],
          ],
        ),
      ),
    );
  }

  // Helper Widget: Dynamic Card Router
  Widget _buildNotificationCard(
    BuildContext context, 
    Map<String, dynamic> item, 
    _ScreenState state,
    bool isToday,
  ) {
    final theme = AppTheme.of(context);
    final Color cardBg = theme.background.shade200!;
    final Color primaryText = theme.text.shade800!;
    final Color subtitleText = theme.text.main!;
    final NotificationType type = item['type'] as NotificationType;

    return Container(
      width: double.infinity,
      padding: Space.all(12, 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── 1. Avatar Indicator Section ───
          if (type == NotificationType.livestream) ...[
            // Specialized Stack with red Live badge wrapped under the avatar
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  padding: Space.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFF3B30), width: 1.6.w), // Terracotta ring border
                    borderRadius: BorderRadius.circular(10.32.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.r),
                    child: Image.asset(
                      item['avatar']!,
                      width: 32.w,
                      height: 32.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -6.h,
                  child: Container(
                    width: 39.w,
                    height: 17.h,
                  // padding: Space.vf(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30), // Solid live indicator Red
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Text(
                        'Live',
                        style: AppText.l1bm!.copyWith(
                          
                          color: Colors.white,
                        
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            // Standard Rounded Avatar representation
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                item['avatar']!,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
          
          Space.xf(16),

          // ─── 2. Notification Text Descriptions ───
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: AppText.b1bm!.cl(primaryText),
                ),
                //Space.yf(2),
                Text(
                  item['time']!,
                  style: AppText.b2?.cl(subtitleText),
                ),

                // ─── 3. Action Buttons (Only for Friend Requests) ───
                if (type == NotificationType.friendRequest) ...[
                  Space.yf(10),
                  Container(
                    width: 152.w,
                    child: Row(
                      
                      children: [
                        // Decline Button
                                    Expanded(
                    child: AppButton(label: "Decline", 
                    buttonType: ButtonType.outlined,
                    borderColor: AppTheme.of(context).primary.shade300,
                    onPressed: (){},
                    backgroundColor: AppTheme.of(context).background.shade200,
                    textColor: AppTheme.of(context).text.shade800,
                    
                    
                    ),
                                    ),
                        Space.xf(6),
                    
                       
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
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}