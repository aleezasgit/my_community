part of '../profile.dart';




class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final Color primaryText = AppTheme.of(context).text.shade800!;
    final Color subtitleText = AppTheme.of(context).text.main!;

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      
      // ─── 1. Top Custom App Bar ─────────────────────────────────────────────

      body: SafeArea(

        child: Column(
          children: [
            UserHeader(
              hasHorizontalPadding: true, //[cite: 5]
              notificationCount: 1, // Displays red notification bubble over notification tray icon[cite: 5]
              hasUnreadMessages: false, //[cite: 5]
              onTapSettings: () => debugPrint('Settings entry point routed'), //[cite: 5]
              onTapMessages: () => debugPrint('Direct Message matrix panel toggled'), //[cite: 5]
              onTapNotifications: () => debugPrint('Notification panel history stacked'), //[cite: 5]
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: Space.hf(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.yf(12),
              
                    // ─── 2. User Info Header Section ──────────────────────────────────
              
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9.6.r),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.2.w, color: AppTheme.of(context).primary.shade300!),
                            ),
                            child: Image.asset(
                              'assets/pngs/Frame 2147229685.png',
                              width: 60.w,
                              height: 60.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Space.xf(21),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Luca Holland',
                                style: AppText.h4b!.cl(primaryText),
                              ),
                              Space.yf(8),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                                style: AppText.l1!.cl(AppTheme.of(context).text.main!),
                              ),
                            ],
                          ),
                        ),
                      
                      ],
                    ),
              
                    Space.yf(21),
              
                    // ─── 3. Professional Switch Tab Bar ──────────────────────────────
                    AppSwitchTabBar(
                      tabs: state.feedTabs,
                      selectedIndex: state.selectedTabIndex,
                      onChanged: (index) => state.setTabIndex(index),
                      variant: AppTabVariant.text,
                      expanded: true, // Auto distributes tabs equally across screen width
                      selectedColor: AppTheme.of(context).primary.main, // Muted sage green matching your mockup active state
                    ),
              
                    Space.yf(16),
              
                    // ─── 4. Dynamic Scrollable Feed List ─────────────────────────────
                    if (state.selectedTabIndex == 0) ...[
                      // Video Post Item
                      VideoPostCard(
                        username: 'Luca Holland (You)',
                        timeAgo: '30 Minutes ago',
                        avatarPath: 'assets/pngs/Frame 2147229685.png',
                        videoThumbnailPath: 'assets/pngs/Frame 2147229685.png',
                        captionUser: 'graffiexplorer',
                        captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
                        likesCount: 60,
                        commentsCount: 15,
                        bookmarksCount: 7,
                      ),
              
                      Space.yf(19),
              
                      // Photo/Carousel Post Item
                      PhotoPostCard(
                        username: 'Luca Holland',
                        timeAgo: '5 Hours ago',
                        avatarPath: 'assets/pngs/Frame 2147229685.png',
                        imagePaths: mockCarouselPhotos,
                        captionUser: 'graffiexplorer',
                        captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
                        likesCount: 45,
                        commentsCount: 8,
                        bookmarksCount: 12,
                      ),
                    ] 
                    else if (state.selectedTabIndex == 1) ...[
                      EventPostCard(
                        organizerName: 'Desert Dash',
                        timeAgo: '5 Hours ago',
                        organizerAvatarPath: 'assets/pngs/Frame 2147229685.png',
                        eventTitle: 'Desert Sprint-Dubai',
                        eventDescription: 'Experience the ultimate desert race with stunning dunes and fast-paced excitement.... more',
                        bannerImagePath: 'assets/pngs/Rectangle 88.png',
                        eventDate: 'Sun 09,2026',
                        eventTime: '07:00 AM',
                        location: 'Al Marmoom',
                        attendeeAvatars: mockAttendees,
                        additionalAttendeesCount: 50,
                        isJoined: true,
                      ),
              
                      Space.yf(10),
              
                      EventPostCard(
                        organizerName: 'Desert Dash',
                        timeAgo: '5 Hours ago',
                        organizerAvatarPath: 'assets/pngs/Frame 2147229685.png',
                        eventTitle: 'Desert Sprint-Dubai',
                        eventDescription: 'Experience the ultimate desert race with stunning dunes and fast-paced excitement.... more',
                        bannerImagePath: 'assets/pngs/Rectangle 88.png',
                        eventDate: 'Sun 09,2026',
                        eventTime: '07:00 AM',
                        location: 'Al Marmoom',
                        attendeeAvatars:mockAttendees,
                        additionalAttendeesCount: 50,
                        isJoined: false, // Variant example showing unjoined button trigger state
                      ),
                    ]
              
                              else if (state.selectedTabIndex == 2) ...[
                      
              
                       savedPost(
                      username: 'Kairo (You)',
                      timeAgo: '53 Minutes ago',
                      avatarPath: 'assets/pngs/Frame 2147229685.png',
                      photoPath: 'assets/pngs/Rectangle 88.png',
                      captionUser: 'graffiexplorer',
                      captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
                      likesCount: 45,
                      commentsCount: 8,
                      bookmarksCount: 12,
                      onMoreTap: () => debugPrint('More pressed'),
                      onLikeTap: () => debugPrint('Like pressed'),
                      onCommentTap: () => debugPrint('Comment pressed'),
                      onBookmarkTap: () => debugPrint('Bookmark pressed'),
                      onVideoPlayTap: () => debugPrint('Video clicked to play/pause'),
                    ),
                    Space.yf(20),
                          savedPost(
                      username: 'Kairo (You)',
                      timeAgo: '53 Minutes ago',
                      avatarPath: 'assets/pngs/Frame 2147229685.png',
                      photoPath: 'assets/pngs/Rectangle 88.png',
                      captionUser: 'graffiexplorer',
                      captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
                      likesCount: 45,
                      commentsCount: 8,
                      bookmarksCount: 0,
                      onMoreTap: () => debugPrint('More pressed'),
                      onLikeTap: () => debugPrint('Like pressed'),
                      onCommentTap: () => debugPrint('Comment pressed'),
                      onBookmarkTap: () => debugPrint('Bookmark pressed'),
                      onVideoPlayTap: () => debugPrint('Video clicked to play/pause'),
                    ),
                    Space.yf(20),
              
                     savedPost(
                      username: 'Kairo (You)',
                      timeAgo: '53 Minutes ago',
                      avatarPath: 'assets/pngs/Frame 2147229685.png',
                      photoPath: 'assets/pngs/Rectangle 88.png',
                      captionUser: 'graffiexplorer',
                      captionText: 'Exploring hidden murals that tell stories of the city\'s soul. zesty flatlay and create a \'lime-light\' ... more',
                      likesCount: 45,
                      commentsCount: 8,
                      bookmarksCount: 12,
                      onMoreTap: () => debugPrint('More pressed'),
                      onLikeTap: () => debugPrint('Like pressed'),
                      onCommentTap: () => debugPrint('Comment pressed'),
                      onBookmarkTap: () => debugPrint('Bookmark pressed'),
                      onVideoPlayTap: () => debugPrint('Video clicked to play/pause'),
                    ),
                    Space.yf(10),
                    ]
              
              else if (state.selectedTabIndex == 3) ...[
                      // Sub Tab Switcher: "My Friends" vs "Requests" chips
                   Row(
                        children: state.friendChips.map((chipName) {
                          final bool isSelected = state.activeFriendChip == chipName;
                          return GestureDetector(
                            onTap: () => state.setFriendChip(chipName),
                            child: Container(
                              margin: Space.only(right: 6),
                              padding: Space.all(12,10),
                              decoration: BoxDecoration(
                                // Selected chips use the Terracotta color, otherwise a soft cream color
                                color: isSelected ?AppTheme.of(context).accent.main :AppTheme.of(context).background.shade200 ,
                                borderRadius: BorderRadius.circular(12.r),
                              
                              ),
                              child: Text(
                                chipName,
                                style: AppText.l1bm!.cl(
                                  isSelected ? Colors.white : AppTheme.of(context).text.shade800!,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Space.yf(16),
              
                      // Search Text Field Wrapper integration
                       SearchField(
              
                     hint: 'Search Friends', name: 'Search Friends', 
                      ),
              
                      Space.yf(10),
              
                      // List renderer routing depending on the active friendSubTabIndex
                      if (state.activeFriendChip == 'My Friends') ...[
                        // Render My Friends
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mockFriendsList.length,
                          separatorBuilder: (context, index) => Space.yf(10),
                          itemBuilder: (context, index) {
                            final item = mockFriendsList[index];
                            return FriendsTile(
                              name: item['name']!,
                              joinedDuration: item['joined']!,
                              avatarPath: item['avatar']!,
                              
                            );
                          },
                        ),
              
                        Space.yf(10),
              
                        // Find Friends Action Bar Button
                        // GestureDetector(
                        //   onTap: () => debugPrint('Navigate to find friends exploration board'),
                        //   child: Container(
                        //     width: double.infinity,
                        //   //  padding: Space.symmetric(vertical: 14.h),
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xFF566B4D), // Muted sage green accent button frame
                        //       borderRadius: BorderRadius.circular(16.r),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Icon(Icons.add_rounded, color: Colors.white, size: 20.w),
                        //         Space.xf(6),
                        //         Text(
                        //           'Find Friends',
                        //           style: AppText.b1b!.cl(Colors.white),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
              
                        AppButton(label: 
                          'Find Friends',
                          onPressed: () {
                            AppRoutes.findfriendscreen.push(context);
                          },
                          buttonType:ButtonType.primaryWithIconLeft,
                          iconPath: 'assets/svgs/addwhite.svg',
                         
                        ),
                      ] else ...[
                        // Render Incoming Pending Requests
                        mockRequestsList.isEmpty
                            ? SizedBox(
                                height: 150.h,
                                child: Center(
                                  child: Text(
                                    'No pending friend requests',
                                    style: AppText.b2!.cl(subtitleText),
                                  ),
                                ),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: mockRequestsList.length,
                                separatorBuilder: (context, index) => Space.yf(10),
                                itemBuilder: (context, index) {
                                  final item = mockRequestsList[index];
                                  return FriendRequestTile(
                                    name: item['name']!,
                                    joinedDuration: item['joined']!,
                                    avatarPath: item['avatar']!,
                                 
                                  );
                                },
                              ),
                              Space.yf(10),
                              
                        AppButton(
                          label: 'Find Friends',
                          onPressed: () {
                            AppRoutes.findfriendscreen.push(context);
                          },
                          buttonType: ButtonType.primaryWithIconLeft,
                          iconPath: 'assets/svgs/addwhite.svg',
                        ),
                      ]
                  ]
                  
              
                    
                    else ...[
                      // Fallback empty view for other tab instances
                      SizedBox(
                        height: 200.h,
                        child: Center(
                          child: Text(
                            'No posts found in ${state.feedTabs[state.selectedTabIndex].label}',
                            style: AppText.b2!.cl(subtitleText),
                          ),
                        ),
                      ),
                    ],
              
                    Space.yf(32),
                  
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