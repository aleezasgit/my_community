import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';


// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class _FriendCard extends StatelessWidget {
  final String title;
  final String members;
  final String imagePath;
  final bool isJoined;
  final VoidCallback onJoinToggle;

  const _FriendCard({
    required this.title,
    required this.members,
    required this.imagePath,
    required this.isJoined,
    required this.onJoinToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.isDark(context);

    // Container background surface surfaces mapping light/dark palette modes
    final Color cardBg = 
         AppTheme.of(context).background.shade200!;
        

    return Container(
  
      padding: Space.all(12, 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16.r),
    
      ),
      child: Row(
        children: [
          // ── Community Avatar Profile Display Frame ──
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
            // width: double.infinity,
             // height: 70.h,
              color: AppTheme.of(context).background.shade200,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                // errorBuilder: (_, __, ___) => Icon(
                //   Icons.groups_rounded,
                //   color: AppTheme.of(context).primary.main,
                //   size: 24.w,
                // ),
              ),
            ),
          ),

          Space.xf(16), // 16.w structured layout spacing gap

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
                  style: AppText.b1!.cl(AppTheme.of(context).text.main!),
                ),
              ],
            ),
          ),

         // Space.x1!,

          // ── Action Button Controller ──
          GestureDetector(
            onTap: onJoinToggle,
            child: Container(
             // duration: UIProps.duration0, // Snappy 150ms state cross-fade velocity response
             // padding: Space.symmetric(horizontal: 12.w, vertical: 8.h),
              width: 66.w,
              height: 32, // Safely encapsulates the tick icon + text layout block
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isJoined 
                    ? AppTheme.of(context).background.main!               // Mockup container light surface background
                    : AppTheme.of(context).accent.main!,      // Active Clay color token
                borderRadius: BorderRadius.circular(8.r),
                // border: isJoined 
                //     ? Border.all(color: AppTheme.of(context).lightGrey.shade300!, width: 1.w)
                //     : null,
              ),
              child: AnimatedSwitcher(
                duration: UIProps.duration0,
                child: isJoined
                    ? Row(
                        key: const ValueKey<bool>(true),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/tick-circle.svg",
                            width: 16.w,
                            height: 16.h,
                         //   color: AppTheme.of(context).white,
                          ),
                          Space.xf(4),
                          Text(
                            'Invited',
                            style: AppText.l1b!.cl(AppTheme.of(context).text.shade800!),
                          ),
                        ],
                      )
                    : Row(
                        key: const ValueKey<bool>(false),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/add.svg"
                            ,
                            width: 16.w,
                            height: 16.h,
                            //color: AppTheme.of(context).white,
                          ),
                          Space.xf(4),
                          Text(
                            'Invite',
                            style: AppText.b2b!.cl(AppTheme.of(context).white!),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    {'title': 'Tech Innovators', 'members': '18K Members', 'image': 'assets/pngs/Frame 2147229685.png'},
    {'title': 'Art Collectors', 'members': '12K Members', 'image': 'assets/pngs/Frame 2147229685.png'},
   // {'title': 'Fitness Freaks', 'members': '30K Members', 'image': 'assets/pngs/fitness.png'},
   // {'title': 'Book Lovers', 'members': '22K Members', 'image': 'assets/pngs/books.png'},
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

            return _FriendCard(
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
                field.didChange(updatedList); // Automatically propagates updates back to FormBuilderState
              },
            );
          },
        );
      },
    );
  }
}

// =============================================================================
// 2. MAIN SCREEN ENTRY (Placed last)
// =============================================================================

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

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