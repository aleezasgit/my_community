import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';
// Ensure this path exactly matches your config file location

class _GenderCard extends StatelessWidget {
  final String label;
  final String svgPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.label,
    required this.svgPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme.isDark(context);

    final Color cardBackground = AppTheme.of(context).background.shade200!;
      

    final Border cardBorder = isSelected
        ? Border.all(color: AppTheme.of(context).accent.main!, width: 1.w)
        : Border.all(color: Colors.transparent, width: 0);

    final Color iconBoxBg = 
         AppTheme.of(context).background.main! ;
       

    return Padding(
      padding: Space.only(bottom:10),
      child: GestureDetector(
        onTap: onTap,
       // behavior: HitTestBehavior.translucent,
        child: Container(
         // duration: UIProps.duration0, // Snappy 150ms micro-animations
          width: double.infinity,
          padding: Space.all(12, 12),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(16.r),
            border: cardBorder,
           
          ),
          child: Row(
            children: [
              // Icon Frame
              Container(
                width: 50.w,
               height:  50.w,
                decoration: BoxDecoration(
                  color: iconBoxBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
               //padding: Space.all(12),
                child: Center(
                  child: SvgPicture.asset(
                    svgPath,
                   // fit: BoxFit.contain,
                  ),
                ),
              ),

              Space.xf(26), // Spacing layout gap token (20.w)

              Expanded(
                child: Text(
                  label,
                  style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ─── 1. Main Testing Screen with Form Example ────────────────────────────────
class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
        title: Text(
          'Select Gender Test',
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

              // Calling our new FormBuilder integrated widget
              GenderFormBuilderField(
                name: 'gender_selection',
                initialValue: 0, // Default to Male
              ),

              Space.yf(32),

              // Submit button to verify FormBuilder state extraction
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    final values = formKey.currentState?.value;
                    debugPrint('Form Data Submitted: $values');
                  }
                },
                child: const Text('Validate & Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── 2. FormBuilder Field Integration Widget ────────────────────────────────
class GenderFormBuilderField extends StatelessWidget {
  final String name;
  final int initialValue;

  const GenderFormBuilderField({
    super.key,
    required this.name,
    this.initialValue = 0,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return FormBuilderField<int>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<int?> field) {
        final int currentValue = field.value ?? initialValue;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _GenderCard(
              label: 'Male',
              svgPath: 'assets/svgs/male.svg',
              isSelected: currentValue == 0,
              onTap: () => field.didChange(0), // Notifies FormBuilderState automatically
            ),
            _GenderCard(
              label: 'Female',
              svgPath: 'assets/svgs/female.svg',
              isSelected: currentValue == 1,
              onTap: () => field.didChange(1),
            ),
            _GenderCard(
              label: 'Prefer not to say',
              svgPath: 'assets/svgs/prefernot.svg',
              isSelected: currentValue == 2,
              onTap: () => field.didChange(2),
            ),
          ],
        );
      },
    );
  }
}

// ─── 3. Option Selection Card Layout ─────────────────────────────────────────
