part of '../share_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final theme = AppTheme.of(context);
    final Color textColorShade = theme.text.shade800!;
    final Color subtitleColorMain = theme.text.main!;

    return Scaffold(
      backgroundColor: theme.background.main,
      
      // ─── 1. Custom Top App Bar Header ───
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Share Profile',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.yf(16),

            // ─── 2. Profile & QR Display Card ───
            Container(
              width: double.infinity,
              padding: Space.all(61.5, 30),
              decoration: BoxDecoration(
                color: theme.background.shade200,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // Circular User Profile Avatar
                  Container(
                  //  padding: Space.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.of(context).accent.main!, // Terracotta ring border
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset(
                      mockAvatarPath,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Space.yf(16),

                  // User Name
                  Text(
                    mockProfileName,
                    style: AppText.b1b!.cl(textColorShade),
                  ),
                  Space.yf(4),

                  // Helper Subtext
                  Text(
                    'Scan to view my profile',
                    style: AppText.l1!.cl(subtitleColorMain),
                  ),
                  Space.yf(16),

                  // ─── QR Code Image Box (with custom frame corners) ───
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Decorative Frame Corners
                      SizedBox(
                        width: 197.w,
                        height: 197.h,
                        child: Image.asset(
                          'assets/pngs/Group 2147236982.png', // Corner visual border brackets
                        ),
                      ),
                      // Core QR image block
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          mockQrCodePath,
                          width: 195.w,
                          height: 195.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Space.yf(16),

                  // Logo Signature Brand bottom hook
                  Text(
                    'quiet.',
                    style: AppText.h5b!.cl(textColorShade
                    ),
                  ),
                  // Container(
                  //   width: 4.6.w,
                  //   height: 4.6.h,
                  //   decoration: BoxDecoration(
                  //     color: AppTheme.of(context).accent.main!, // Terracotta underline accent
                  //     borderRadius: BorderRadius.circular(50.r),
                  //   ),
                  // )
                ],
              ),
            ),

            Space.yf(24),

            // ─── 3. Copy Profile Link Row ───
            Container(
              width: double.infinity,
              padding: Space.all(16, 12),
              decoration: BoxDecoration(
                color: theme.background.shade200,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/linkk.svg',
                    width: 24.w,
                    height: 24.h,
                    //colorFilter: ColorFilter.mode(textColorShade, BlendMode.srcIn),
                  ),
                  Space.xf(12),
                  Expanded(
                    child: Text(
                      mockProfileLink,
                      style: AppText.b1!.cl(textColorShade),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Space.xf(12),
                  GestureDetector(
                    onTap: () => state.copyToClipboard(context, mockProfileLink),
                    child: SvgPicture.asset(
                      'assets/svgs/copy.svg', // Clean copy pages stack icon
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ),

            Space.yf(24),

            // Section Label Divider
            Text(
              'Or Share via',
              style: AppText.b2!.cl(subtitleColorMain),
            ),
            Space.yf(16),

            // ─── 4. Horizontal Sharing Channel Grid Chips ───
            SizedBox(
              height: 93.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: shareChannels.length,
                itemBuilder: (context, index) {
                  final channel = shareChannels[index];
                  final bool isSelected = state.selectedShareChannel == channel['id'];

                  // Color definitions based on active chip parameters
                  final Color containerColor = isSelected 
                      ? (theme.accent.main ?? AppTheme.of(context).accent.main!) 
                      : theme.background.shade200!;
                  
                  final Color iconColor = isSelected 
                      ? Colors.white 
                      : theme.text.shade800!;

                  return Padding(
                    padding: Space.only(right: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Standalone Rounded Square Interactive Icon Chip
                        GestureDetector(
                          onTap: () => state.selectShareChannel(channel['id']!),
                          child: AnimatedContainer(
                            duration: UIProps.duration0,
                            width: 52.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                channel['svgPath']!,
                                width: 20.w,
                                height: 20.h,
                                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                        Space.yf(4),
                        
                        // Icon Label Underneath
                        Text(
                          channel['label']!,
                          style: AppText.l1!.cl(subtitleColorMain),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            Space.yf(32),
          ],
        ),
      ),
    );
  }
}