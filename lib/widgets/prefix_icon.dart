import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrefixIcon extends StatelessWidget {
  final String iconPath;
  final double? iconSize;
  final Color? color;

  const PrefixIcon({
    super.key,
    required this.iconPath,
    this.iconSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? IconTheme.of(context).color;

    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 5.w),
      child: SvgPicture.asset(
        iconPath,
        width: iconSize ?? 16.w,
        height: iconSize ?? 16.h,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
