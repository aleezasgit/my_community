import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextLogo extends StatelessWidget {
  final double? size;
  const AppTextLogo({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SvgPicture.asset(
      isDark ? 'assets/svgs/Logo_dark.svg' : 'assets/svgs/Logo.svg',
      height: size ?? 31.h,
    );
  }
}
