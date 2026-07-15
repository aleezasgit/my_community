part of '../notification_settings.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final theme = AppTheme.of(context);
    final Color titleColor = theme.text.shade800!;
    final Color descColor = theme.text.main!;

    return Scaffold(
      backgroundColor: theme.background.main,
      
      // ─── 1. Custom Center Top App Bar ───
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Notification Settings',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      // ─── 2. Scrollable Cards List ───
      body: ListView.separated(
        padding: Space.all(16, 16),
        physics: const BouncingScrollPhysics(),
        itemCount: notificationItems.length,
        separatorBuilder: (context, index) => Space.yf(10),
        itemBuilder: (context, index) {
          final item = notificationItems[index];
          final String id = item['id']!;
          final bool active = state.isEnabled(id);

          return Container(
            width: double.infinity,
            padding: Space.all(16, 16),
            height: 103,
            decoration: BoxDecoration(
              color: theme.background.shade200, // Matches your card's white background
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // 🎯 Switch aligns to top of text
              children: [
                // Text Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item['title']!,
                            style: AppText.b1bm!.cl(titleColor), // Bold Title
                          ),
                           Spacer(),
                             // ─── 3. Custom Colored Terracotta Toggle Switch ───
                Switch.adaptive(
                  
                  value: active,
                  activeColor: AppTheme.of(context).background.shade200, // 🎯 Terracotta active color
                  activeTrackColor: AppTheme.of(context).accent.main,
                  inactiveTrackColor: AppTheme.of(context).background.main,
                  onChanged: (_) => state.toggleSetting(id),
                ),
                        ],
                      ),
                      Space.yf(6),
                      Text(
                        item['desc']!,
                        style: AppText.b2!.cl(descColor).copyWith(
                        //  height: 1.3, // Match line height
                        ),
                      ),
                    ],
                  ),
                ),
              

             
              ],
            ),
          );
        },
      ),
    );
  }
}