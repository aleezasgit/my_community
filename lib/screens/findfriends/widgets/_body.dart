part of '../find_friends.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final Color textColorShade = AppTheme.of(context).text.shade800!;
    final Color subtitleColorMain = AppTheme.of(context).text.main!;

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      
      // ─── 1. Top Custom App Bar Header ─────────────────────────────────────
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Find Friends',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.yf(16),

            // ─── 2. Share Profile Link Custom Banner Box ─────────────────────
            Container(
              width: double.infinity,
              padding: Space.all(12, 12),
              decoration: BoxDecoration(
                color: AppTheme.of(context).background.shade200,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppTheme.of(context).accent.main!, // Subtle terracotta border trace
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  // Link Icon Container
                  Container(
                    //width: 44.w,
                   // height: 44.h,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).background.main,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: Space.all(10),
                    child: SvgPicture.asset(
                      'assets/svgs/linkk.svg',
                      //colorFilter: const ColorFilter.mode(Color(0xFF566B4D), BlendMode.srcIn),
                    height: 24.h,
                    width: 24.w,
                    ),
                  ),
                  Space.xf(10),
                  
                  // Text Block Link descriptors
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share Profile Link',
                          style: AppText.b1b!.cl(textColorShade),
                        ),
                        Space.yf(4),
                        Text(
                          'www:/https/community/link',
                          style: AppText.l1!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  //Space.xf(8),
                  
                  // Share/Send Arrow Icon
                  GestureDetector(
                    onTap: () {
                      AppRoutes.shareProfileScreen.push(context);
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/send-2.svg', // Maps matching share send action logo context
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ),

            Space.yf(22),

            // Middle Helper Descriptor Copy Block
            Text(
              'Or send Invite to friends',
              style: AppText.b2!.cl(AppTheme.of(context).text.main!),
            ),

            Space.yf(22),

            // ─── 3. Global Search Text Field Input ────────────────────────────
            SearchField(
              hint: 'Search',
               name: 'searchField',
            ),

            Space.yf(10),

            // ─── 4. Invite Suggestions List Pipeline ─────────────────────────
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mockInviteSuggestionsList.length,
              separatorBuilder: (context, index) => Space.yf(10)!,
              itemBuilder: (context, index) {
                final friend = mockInviteSuggestionsList[index];
                
                return InviteTile(
                  name: friend['name']!,
                  joinedDuration: friend['joined']!,
                  avatarPath: friend['avatar']!,
                  onInviteTap: () {
                    debugPrint('Invite request dispatched to: ${friend['name']}');
                  },
                );
              },
            ),

            Space.yf(32),
          ],
        ),
      ),
    );
  }
}