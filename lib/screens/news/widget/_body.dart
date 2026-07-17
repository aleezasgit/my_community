part of '../news_screen.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    
    // Map categories structure safely into AppTab instances for the custom slider
    final List<AppTab> tabItems = newsCategories.map((name) => AppTab(label: name)).toList(); //[cite: 6]

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      body: SafeArea(
        child: Column(
          children: [
            // ─── 1. Core Header Shell (Using your pre-built UserHeader) ───
            UserHeader(
              hasHorizontalPadding: true, //[cite: 5]
              notificationCount: 1, // Displays red notification bubble over notification tray icon[cite: 5]
              hasUnreadMessages: false, //[cite: 5]
              onTapSettings: () => debugPrint('Settings entry point routed'), //[cite: 5]
              onTapMessages: () => debugPrint('Direct Message matrix panel toggled'), //[cite: 5]
              onTapNotifications: () => debugPrint('Notification panel history stacked'), //[cite: 5]
            ),

            // ─── Main Content Scroll View Container ───
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: Space.hf(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─── 2. Prominent Banner Container ───
                    Container(
                      width: double.infinity,
                      padding: Space.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).accent.main, // Terracotta accent base fill
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Updates",
                                style: AppText.b1b!.cl(Colors.white),
                              ),
                              Space.yf(4),
                              Text(
                                "View all the new blog here",
                                style: AppText.b1bm!.cl(AppTheme.of(context).white!),
                              ),
                            ],
                          ),
                          Text(
                            'q.',
                            style:
                           AppText.h5bm!.cl(AppTheme.of(context).white!).copyWith(fontSize: 32),
                          )
                        ],
                      ),
                    ),
                    
                    Space.yf(16),

                    // ─── 3. Horizontal Categories Filter Row (Using your pre-built AppSwitchTabBar) ───
// ─── 3. Horizontal Categories Filter Row (Using your pre-built AppSwitchTabBar) ───
SizedBox(
  height: 38.h,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    itemCount: newsCategories.length,
    separatorBuilder: (context, index) => Space.xf(12)!,
    itemBuilder: (context, index) {
      final bool isSelected = state.selectedCategoryIndex == index;
      return GestureDetector(
        onTap: () => state.changeCategory(index),
        child: Container(
          height: 37.h,
          width: 44.w,
         // padding: Space.all(12,10),
          decoration: BoxDecoration(
            color: isSelected 
                ?  AppTheme.of(context).primary.main // Your exact active deep sage green color from the screenshot
                : AppTheme.of(context).background.shade200, // Predefined unselected bubble color
            borderRadius: BorderRadius.circular(12.r),
            // border: Border.all(
            //   color: isSelected 
            //       ? Colors.transparent 
            //       : AppTheme.of(context).lightGrey.main ?? Colors.transparent, // Boundary border fallback
            //   width: 1.w,
            // ),
          ),
          child: Center(
            child: Text(
              newsCategories[index],
              style: AppText.l1bm!.cl(
                isSelected 
                    ? AppTheme.of(context).white ?? Colors.white 
                    : AppTheme.of(context).text.shade800!,
              ),
            ),
          ),
        ),
      );
    },
  ),
),

                    Space.yf(13),

                    // ─── 4. Vertical News Feed Stream ───
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: staticNewsArticles.length,
                      separatorBuilder: (context, index) => Space.yf(10),
                      itemBuilder: (context, index) {
                        final article = staticNewsArticles[index];
                        return NewsArticleCard(
                          title: article['title']!,
                          content: article['content']!,
                          imagePath: article['imagePath']!,
                          hashtags: List<String>.from(article['hashtags']),
                          badgeText: article['badgeText']!,
                          onTap: () {
                         AppRoutes.newsDetails.push(context);
                          },
                        );
                      },
                    ),
                    Space.yf(24),
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