import 'package:flutter/material.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/member.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/my_events.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/request_event.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/status.dart';
import 'package:my_community/screens/profile/events.dart';


class GroupProfileDisplayScreen extends StatelessWidget {
  const GroupProfileDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final mockAttendeesList = [
      'assets/pngs/Frame 2147229685.png',
      'assets/pngs/Rectangle 88.png',
      'assets/pngs/Frame 2147229685.png',
       'assets/pngs/Rectangle 88.png',
      'assets/pngs/Frame 2147229685.png',
       'assets/pngs/Rectangle 88.png',
    ];

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Community Workspace',
          style: AppText.h6b!.cl(AppTheme.of(context).text.shade800!),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(16),

            // Call Component 2: Analytics Stats Panel Card Hook
            const CommunityStatsCard(
              communityName: 'Tech Innovators',
              creatorName: 'Borealis',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              badgeCount: 15,
              friendsCount: 24,
              totalMembers: '25k',
              totalPosts: '10k',
              createdYear: '2023',
            ),

            Space.yf(20),

            // Call Component 1: Individual Member Row Tile Frame Hook
            MemberTile(
              name: 'Eliot Harper',
              joinedDuration: '2w',
              avatarPath: 'assets/pngs/Frame 2147229685.png',
              onMessageTap: () => debugPrint('Open Chat Room Instance with Eliot'),
            ),


Space.yf(20),
            ///PROFILE SECTION
            ///
            ///EVENT CARD
            
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
            attendeeAvatars: mockAttendeesList,
              additionalAttendeesCount: 50,
              isJoined: true,
              onJoinTap: () => debugPrint('Join status modified'),
              onCardTap: () => debugPrint('Navigate towards specified event parameters'),
            ),

            Space.yf(24),

            MyEventPostCard(
  organizerName: 'Desert Dash',
  timeAgo: '5 Hours ago',
  organizerAvatarPath: 'assets/pngs/Frame 2147229685.png',
  eventTitle: 'Desert Sprint-Dubai',
  eventDescription: 'Experience the ultimate desert race with stunning dunes and fast-paced excitement.... more',
  bannerImagePath: 'assets/pngs/Rectangle 88.png',
  eventDate: 'Sun 09,2026',
  eventTime: '07:00 AM',
  location: 'Al Marmoom',
  attendeeAvatars: mockAttendeesList,
  additionalAttendeesCount: 50,
  isJoined: true,
  onJoinTap: () => debugPrint('Join status modified'),
  onCardTap: () => debugPrint('Navigate towards specified event parameters'),
),


Space.yf(10),

RequestEvent(
  organizerName: 'Ahmad',
  timeAgo: '5 Hours ago',
  organizerAvatarPath: 'assets/pngs/Frame 2147229685.png',
  eventTitle: 'Desert Sprint-Dubai',
  eventDescription: 'Experience the ultimate desert race with stunning dunes and fast-paced excitement.... more',
  bannerImagePath: 'assets/pngs/Rectangle 88.png',
  eventDate: 'Sun 09,2026',
  eventTime: '07:00 AM',
  location: 'Al Marmoom',
  attendeeAvatars: mockAttendeesList,
  additionalAttendeesCount: 50,
  isJoined: true,
  onDeclineTap: () => debugPrint('Event request declined'),
  onAcceptTap: () => debugPrint('Event request accepted'),
  onCardTap: () => debugPrint('Navigate towards specified event parameters'),
)
          ],
        ),
      ),
    );
  }
}