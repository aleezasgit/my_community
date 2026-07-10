import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community_at_app/statics/app_statics.dart';

// ─── Cross Button ─────────────────────────────────────────────────────────────

class CrossButton extends StatelessWidget {
  final VoidCallback onTap;

  /// Fill color of the circle. Defaults to white.
  final Color backgroundColor;

  /// Color of the X icon. Defaults to red.
  final Color iconColor;

  /// Diameter of the button. Defaults to 56.
  final double size;

  const CrossButton({
    super.key,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.iconColor = const Color(0xFFE13C36),
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppStaticData.cross, // replace with your SVG path
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

// ─── Tick Button ──────────────────────────────────────────────────────────────

class TickButton extends StatelessWidget {
  final VoidCallback onTap;

  /// Fill color of the inner circle. Defaults to dark green.
  final Color backgroundColor;

  /// Color of the outer ring. Pass null to hide the ring.
  final RadialGradient backgroundGradient;

  /// Diameter of the inner circle. Defaults to 56.
  final double size;

  /// Width of the outer ring border. Defaults to 3.

  const TickButton({
    super.key,
    required this.onTap,
    this.backgroundColor = const Color(0xFF1A2A24),
    this.size = 32,
    required this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.w,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.w,
          height: size.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: backgroundGradient,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppStaticData.checked, // replace with your SVG path
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
      ),
    );
  }
}
