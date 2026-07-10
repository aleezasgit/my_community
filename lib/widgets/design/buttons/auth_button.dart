// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:my_community_at_app/configs/configs.dart';

// class AuthButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   final String? iconPath;

//   const AuthButton({
//     super.key,
//     required this.label,
//     required this.onTap,
//     this.iconPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: Space.vf(14),
//         decoration: BoxDecoration(
//           color: AppTheme.c.background.shade100,

//           borderRadius: UIProps.buttonRadius,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (iconPath != null) ...[
//               SvgPicture.asset(iconPath!, width: 24.w, height: 24.h),
//               8.horizontalSpace,
//             ],
//             Text(
//               label,
//               style: AppText.b1bm!.w(6).cl(AppTheme.c.text.shade100!),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
