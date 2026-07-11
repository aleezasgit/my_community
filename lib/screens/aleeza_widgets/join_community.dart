import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/configs/configs.dart';


// ─── 1. Main Communities Screen with Form Example ────────────────────────────
class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Communities',
          style: AppText.h6b!.cl(AppTheme.of(context).text.shade800!),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),

              // Custom multi-selection FormBuilder field for community memberships
              CommunitiesFormBuilderField(
                name: 'joined_communities',
                initialValue: const [], // Empty initially, user clicks to join
              ),

              Space.yf(32),

              // Submit Action to inspect current form state values
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    final values = formKey.currentState?.value;
                    debugPrint('Current Joined Communities: $values');
                  }
                },
                child: const Text('Save Memberships'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── 2. FormBuilder Field Integration ────────────────────────────────────────
class CommunitiesFormBuilderField extends StatelessWidget {
  final String name;
  final List<String> initialValue;

  CommunitiesFormBuilderField({
    super.key,
    required this.name,
    this.initialValue = const [],
  });

  // Mock static payload data containing community titles and member counts
  final List<Map<String, String>> _kCommunitiesData = [
    {'title': 'Tech Innovators', 'members': '18K Members', 'image': 'assets/pngs/tech.png'},
    {'title': 'Art Collectors', 'members': '12K Members', 'image': 'assets/pngs/art.png'},
    {'title': 'Fitness Freaks', 'members': '30K Members', 'image': 'assets/pngs/fitness.png'},
    {'title': 'Book Lovers', 'members': '22K Members', 'image': 'assets/pngs/books.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<List<String>?> field) {
        final List<String> joinedList = field.value ?? [];

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _kCommunitiesData.length,
          itemBuilder: (context, index) {
            final item = _kCommunitiesData[index];
            final String title = item['title']!;
            final String members = item['members']!;
            final String imagePath = item['image']!;
            final bool isJoined = joinedList.contains(title);

            return _CommunityRowCard(
              title: title,
              members: members,
              imagePath: imagePath,
              isJoined: isJoined,
              onJoinToggle: () {
                final updatedList = List<String>.from(joinedList);
                if (isJoined) {
                  updatedList.remove(title);
                } else {
                  updatedList.add(title);
                }
                field.didChange(updatedList); // Automatically propagates changes back to FormBuilderState
              },
            );
          },
        );
      },
    );
  }
}

// ─── 3. Sub-Component List Row Container ─────────────────────────────────────
class _CommunityRowCard extends StatelessWidget {
  final String title;
  final String members;
  final String imagePath;
  final bool isJoined;
  final VoidCallback onJoinToggle;

  const _CommunityRowCard({
    required this.title,
    required this.members,
    required this.imagePath,
    required this.isJoined,
    required this.onJoinToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.isDark(context);

    // Default container backgrounds following your card rules
    final Color cardBg = isDark 
        ? AppTheme.of(context).background.shade100! 
        : const Color(0xFFFDFCFB);

    return Container(
      margin: Space.only(bottom: 12),
      padding: Space.all(12, 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: UIProps.cardShadow,
      ),
      child: Row(
        children: [
          // ── Community Avatar Profile Display Frame ──
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              width: 54.w,
              height: 54.w,
              color: AppTheme.of(context).background.shade200,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.groups_rounded,
                  color: AppTheme.of(context).primary.main,
                  size: 24.w,
                ),
              ),
            ),
          ),

          Space.x1!, // 16.w structured layout spacing rule gap

          // ── Text Descriptions Meta Column ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Space.yf(4),
                Text(
                  members,
                  style: AppText.b2!.cl(AppTheme.of(context).text.main!),
                ),
              ],
            ),
          ),

          Space.x1!,

          // ── Action Button Controller (Animates button properties smoothly) ──
          GestureDetector(
            onTap: onJoinToggle,
            child: AnimatedContainer(
              duration: UIProps.duration0, // Snappy 150ms state cross-fade velocity response
              //padding: Space.symmetric(horizontal: 16.w, vertical: 8.h),
              width: 82.w, // Fixed explicit width bounding matching mockup content
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isJoined 
                    ? AppTheme.of(context).background.shade400! // Muted background color state
                    : AppTheme.of(context).accent.main!,      // Active Clay color token
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AnimatedSwitcher(
                duration: UIProps.duration0,
                child: Text(
                  isJoined ? 'Joined' : '+ Join',
                  key: ValueKey<bool>(isJoined),
                  style: AppText.b2b!.cl(
                    isJoined 
                        ? AppTheme.of(context).text.shade800! // Dark readable text on muted tag
                        : AppTheme.of(context).white!,        // White text on active Clay action
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}