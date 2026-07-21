// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_community/configs/configs.dart';



// class _InterestChip extends StatelessWidget {
//   final String label;
//   final String svgPath;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _InterestChip({
//     required this.label,
//     required this.svgPath,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isDark = AppTheme.isDark(context); //[cite: 3]

//     // Active backgrounds turn into Clay Accent color, inactive into light paper shades[cite: 3]
//     final Color chipBg = isSelected
//         ? AppTheme.of(context).accent.main!
//         : (AppTheme.of(context).background.shade200!);

//     // Dynamic Text color flip
//     final Color textColor = isSelected
//         ? AppTheme.of(context).white!
//         : AppTheme.of(context).text.shade800!; //[cite: 3]

//     return GestureDetector(
//       onTap: onTap,
//      // behavior: HitTestBehavior.translucent,
//       child: Container(
       
//         padding: Space.all(12, 11.5), //[cite: 9]
//         decoration: BoxDecoration(
//           color: chipBg,
//           borderRadius: BorderRadius.circular(12.r), // High pill curvature
//           // border: isSelected 
//           //     ? null 
//           //     : Border.all(width: 1.w), //[cite: 3]
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min, // Ensures chips wrap text dimensions tightly
//           children: [
//             SvgPicture.asset(
//               svgPath,
//               width: 20.w,
//               height: 20.h,
//               fit: BoxFit.contain,
//             ),
//             Space.xf(8), //[cite: 9]
//             Text(
//               label,
//               style: AppText.l1bm!.cl(textColor), //[cite: 4, 5]
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class InterestsFormBuilderField extends StatelessWidget {
//   final String name;
//   final List<String> initialValue;

//   InterestsFormBuilderField({
//     super.key,
//     required this.name,
//     this.initialValue = const [],
//   });

//   // Mock data mapping the labels to their specific asset paths
//   final List<Map<String, String>> _kInterestData = [
//     {'label': 'Music', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Fashion', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Games', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Pet', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Travelling', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Technology', 'asset': 'assets/svgs/Activity.svg'},
//     {'label': 'Beauty', 'asset': 'assets/svgs/Activity.svg'},

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderField<List<String>>(
//       name: name,
//       initialValue: initialValue,
//       builder: (FormFieldState<List<String>?> field) {
//         final List<String> currentSelections = field.value ?? [];

//         return Wrap(
//           spacing: 10.w,  // Horizontal gap between chips
//           runSpacing: 12.h, // Vertical gap between lines
//           children: _kInterestData.map((interest) {
//             final String label = interest['label']!;
//             final String asset = interest['asset']!;
//             final bool isSelected = currentSelections.contains(label);

//             return _InterestChip(
//               label: label,
//               svgPath: asset,
//               isSelected: isSelected,
//               onTap: () {
//                 // Mutates selection array on tap and passes it back to FormBuilderField
//                 final updatedSelections = List<String>.from(currentSelections);
//                 if (isSelected) {
//                   updatedSelections.remove(label);
//                 } else {
//                   updatedSelections.add(label);
//                 }
//                 field.didChange(updatedSelections);
//               },
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }

// //screen for testing the multi-selection form field

// class InterestsScreen extends StatelessWidget {
//   const InterestsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     App.init(context); //[cite: 14]
//     final formKey = GlobalKey<FormBuilderState>();

//     return Scaffold(
//       backgroundColor: AppTheme.of(context).background.main,
//       appBar: AppBar(
//         title: Text(
//           'Interests',
//           style: AppText.h6b!.cl(AppTheme.of(context).text.shade800!), 
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: Space.hf(16), //[cite: 9]
//         child: FormBuilder(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Space.yf(16), //[cite: 9]

//               // Custom multi-selection FormBuilder field
//               InterestsFormBuilderField(
//                 name: 'selected_interests',
//                 initialValue: const ['Technology', 'Food'], // Pre-selected mockup states
//               ),

//               Space.yf(32), //[cite: 9]

//               // Submit Action to test FormBuilder extraction
//               ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState?.saveAndValidate() ?? false) {
//                     final values = formKey.currentState?.value;
//                     debugPrint('Form Data Submitted: $values');
//                   }
//                 },
//                 child: const Text('Save Interests'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class _InterestChip extends StatelessWidget {
  final String label;
  final String svgPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _InterestChip({
    required this.label,
    required this.svgPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Active backgrounds turn into terracotta accent color, inactive into light paper shades
    final Color chipBg = isSelected
        ? AppTheme.of(context).accent.main!
        : AppTheme.of(context).background.shade200!;

    // Dynamic Text color flip
    final Color textColor = isSelected
        ? AppTheme.of(context).white!
        : AppTheme.of(context).text.shade800!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(12, 11.5),
        decoration: BoxDecoration(
          color: chipBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Ensures chip tightly wraps content
          children: [
            SvgPicture.asset(
              svgPath,
              width: 20.w,
              height: 20.h,
              fit: BoxFit.contain,
            ),
            Space.xf(8),
            Text(
              label,
              style: AppText.l1bm!.cl(textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestsFormBuilderField extends StatelessWidget {
  final String name;
  final List<String> initialValue;

  InterestsFormBuilderField({
    super.key,
    required this.name,
    this.initialValue = const [],
  });

  // Updated dataset matching the image mockup
  final List<Map<String, String>> _kInterestData = const [
    {'label': 'Music', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Fashion', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Games', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Pet', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Travelling', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Technology', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Beauty', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Food', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Comedy', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Skincare', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Wellness', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Bag', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Accessories', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Architecture', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Art', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Sport', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Film', 'asset': 'assets/svgs/Activity.svg'},
    {'label': 'Drama', 'asset': 'assets/svgs/Activity.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<List<String>?> field) {
        final List<String> currentSelections = field.value ?? [];

        return Wrap(
          spacing: 10.w,  // Horizontal gap between chips[cite: 3]
          runSpacing: 12.h, // Vertical gap between lines[cite: 3]
          children: _kInterestData.map((interest) {
            final String label = interest['label']!;
            final String asset = interest['asset']!;
            final bool isSelected = currentSelections.contains(label);

            return _InterestChip(
              label: label,
              svgPath: asset,
              isSelected: isSelected,
              onTap: () {
                final updatedSelections = List<String>.from(currentSelections);
                if (isSelected) {
                  updatedSelections.remove(label);
                } else {
                  updatedSelections.add(label);
                }
                field.didChange(updatedSelections);
              },
            );
          }).toList(),
        );
      },
    );
  }
}

