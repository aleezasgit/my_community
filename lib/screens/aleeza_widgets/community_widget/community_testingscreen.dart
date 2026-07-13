import 'package:flutter/material.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/member.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/status.dart';


class GroupProfileDisplayScreen extends StatelessWidget {
  const GroupProfileDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

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

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}