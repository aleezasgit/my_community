import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community_at_app/configs/configs.dart';

part 'enums.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isDisabled;
  final Color? backgroundColor;
  final double? height;
  final Color? textColor;
  final TextStyle? textStyle;
  final ButtonType? buttonType;
  final String? iconPath;
  final Color? borderColor;
  final double? iconSize;
  final VoidCallback? onDoubleTap;
  final Color? iconColor;
  final double? horizontalPadding;
  final double? spaceBetweenIconAndText;
  final double? verticalPadding;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.height,
    this.backgroundColor,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.isDisabled = false,
    super.key,
    this.textColor,
    this.iconPath,
    this.borderColor,
    this.iconSize,
    this.onDoubleTap,
    this.iconColor,
    this.horizontalPadding,
    this.spaceBetweenIconAndText,
    this.verticalPadding,
  });

  bool get _isOutlined =>
      buttonType == ButtonType.outlined ||
      buttonType == ButtonType.outlinedWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconRight;

  bool get _hasIconLeft =>
      buttonType == ButtonType.primaryWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconLeft;

  bool get _hasIconRight =>
      buttonType == ButtonType.primaryWithIconRight ||
      buttonType == ButtonType.outlinedWithIconRight;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: isDisabled ? () {} : onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: UIProps.buttonRadius,
          color: isDisabled
              ? AppTheme.of(context).lightGrey.main!
              : _isOutlined
              ? backgroundColor ?? Colors.transparent
              : backgroundColor ?? AppTheme.of(context).primary.main,
          border: _isOutlined
              ? Border.all(
                  color: isDisabled
                      ? const Color(0xFFE5E9F7)
                      : borderColor ?? AppTheme.of(context).lightGrey.main!,
                  width: 1.w,
                  strokeAlign: BorderSide.strokeAlignInside,
                )
              : null,
        ),
        padding: Space.vf(verticalPadding ?? 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_hasIconLeft) ...[
              _buildIcon(context),
              SizedBox(width: spaceBetweenIconAndText ?? 8.w),
            ],
            Text(
              label,
              style: isDisabled
                  ? textStyle?.copyWith(
                          color: AppTheme.of(context).text.main!,
                        ) ??
                        AppText.b1b!.cl(AppTheme.of(context).text.main!)
                  : textStyle ??
                        AppText.b1b!
                            .cl(
                              textColor ??
                                  (_isOutlined
                                      ? AppTheme.of(context).text.shade800!
                                      : AppTheme.of(context).white!),
                            )
                            .copyWith(height: 1.5),
            ),
            if (_hasIconRight) ...[
              SizedBox(width: spaceBetweenIconAndText ?? 8.w),
              _buildIcon(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final icon = SvgPicture.asset(
      iconPath!,
      width: iconSize ?? 20.w,
      height: iconSize ?? 20.h,
    );

    if (iconColor == null) return icon;

    return SvgPicture.asset(
      iconPath!,
      width: iconSize ?? 20.w,
      height: iconSize ?? 20.h,
      colorFilter: ColorFilter.mode(
        isDisabled ? AppTheme.of(context).lightGrey.main! : iconColor!,
        BlendMode.srcIn,
      ),
    );
  }
}
