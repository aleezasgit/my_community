part of '../find_friends.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final Color textColorShade = AppTheme.of(context).text.shade100!;
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
            Space.yf(12),

            // ─── 2. Share Profile Link Custom Banner Box ─────────────────────
            Container(
              width: double.infinity,
              padding: Space.all(12, 12),
              decoration: BoxDecoration(
                color: AppTheme.of(context).background.shade200,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFFC77C5E).withOpacity(0.4), // Subtle terracotta border trace
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  // Link Icon Container
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).background.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: Space.all(10),
                    child: SvgPicture.asset(
                      'assets/svgs/link.svg',
                      colorFilter: const ColorFilter.mode(Color(0xFF566B4D), BlendMode.srcIn),
                    ),
                  ),
                  Space.xf(12)!,
                  
                  // Text Block Link descriptors
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share Profile Link',
                          style: AppText.b1b!.cl(textColorShade),
                        ),
                        Space.yf(2),
                        Text(
                          'www:/https/community/link',
                          style: AppText.l1!.cl(subtitleColorMain),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Space.xf(8)!,
                  
                  // Share/Send Arrow Icon
                  SvgPicture.asset(
                    'assets/svgs/send-arrow.svg', // Maps matching share send action logo context
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
            ),

            Space.yf(20),

            // Middle Helper Descriptor Copy Block
            Text(
              'Or send Invite to friends',
              style: AppText.b2!.cl(subtitleColorMain),
            ),

            Space.yf(16),

            // ─── 3. Global Search Text Field Input ────────────────────────────
            SearchField(
              hint: 'Search',
               name: 'searchField',
            ),

            Space.yf(16),

            // ─── 4. Invite Suggestions List Pipeline ─────────────────────────
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mockInviteSuggestionsList.length,
              separatorBuilder: (context, index) => Space.yf(12)!,
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