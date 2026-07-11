import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

// =============================================================================
// 1. SUB-COMPONENT WIDGETS (Placed first)
// =============================================================================

class _CreationOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String svgPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _CreationOptionCard({
    required this.title,
    required this.description,
    required this.svgPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.isDark(context);

    // Container background surface mapping your theme design specifications
    final Color cardBg = AppTheme.of(context).background.shade200!;

    // Applies a clean matching highlight line profile if selected
    // final Border cardBorder = isSelected
    //     ? Border.all(color: AppTheme.of(context).accent.main!, width: 1.5.w)
    //     : Border.all(color: Colors.transparent, width: 1.5.w);

    return Padding(
      padding: Space.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child:Container(
         // duration: UIProps.duration0, // 150ms structural frame transition response curve
          width: double.infinity,
          padding: Space.all(12, 16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16.r), // Smooth large curvature bounding frame
            //border: cardBorder,
           // boxShadow: isSelected ? UIProps.cardShadow : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top Row Segment: Icon Badge Graphic Frame ──
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color:  AppTheme.of(context).background.main!,
                  borderRadius: BorderRadius.circular(12.r),
                ),
               // padding: Space.all(10),
                child: Center(
                  child: SvgPicture.asset(
                    width: 24.w,
                    height: 24.h,
                    svgPath,
                    //fit: BoxFit.contain,
                  ),
                ),
              ),

              Space.yf(16),

              // ── Middle Row Segment: Section Title Typography ──
              Text(
                title,
                style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
              ),

              Space.yf(8),

              // ── Bottom Row Segment: Description Copy Details ──
              Text(
                description,
                style: AppText.b1!.cl(AppTheme.of(context).text.main!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreationTypeFormBuilderField extends StatelessWidget {
  final String name;
  final String? initialValue;

  const CreationTypeFormBuilderField({
    super.key,
    required this.name,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<String?> field) {
        final String currentValue = field.value ?? '';

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CreationOptionCard(
              title: 'Add Story',
              description: 'Share photos, thoughts, or updates that stay on your profile.',
              svgPath: 'assets/svgs/story.svg',
              isSelected: currentValue == 'story',
              onTap: () => field.didChange('story'), // Propagates selection back to parent FormBuilder State
            ),
            _CreationOptionCard(
              title: 'Add Post',
              description: 'Share moments that deserve a permanent place on your profile.',
              svgPath: 'assets/svgs/add-circle.svg',
              isSelected: currentValue == 'post',
              onTap: () => field.didChange('post'),
            ),
          ],
        );
      },
    );
  }
}

// =============================================================================
// 2. MAIN SCREEN ENTRY (Placed last)
// =============================================================================

class ShareMomentScreen extends StatelessWidget {
  const ShareMomentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Create',
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

              // Form field container setup mapping options cleanly
              const CreationTypeFormBuilderField(
                name: 'selected_creation_type',
                initialValue: 'story', // Default state configuration assignment
              ),

              Space.yf(24),

              // Setup submission trigger node to test extraction mechanics
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    final values = formKey.currentState?.value;
                    debugPrint('Extracted Creation Context Target: $values');
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}