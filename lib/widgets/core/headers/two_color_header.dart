import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community_at_app/configs/configs.dart';

enum HighlightPosition { first, second }

class TwoColorHeading extends StatelessWidget {
  final String firstText;
  final String secondText;
  final HighlightPosition highlightPosition;
  final String? subtitle;
  final Widget? subtitleWidget;
  final bool isCentered;
  final double? titleFontSize;
  final Color? highlightColor;
  final Color? defaultColor;
  final double? spacingBetweenTitleAndSubtitle;

  const TwoColorHeading({
    super.key,
    required this.firstText,
    required this.secondText,
    this.highlightPosition = HighlightPosition.second,
    this.subtitle,
    this.subtitleWidget,
    this.isCentered = false,
    this.titleFontSize,
    this.highlightColor,
    this.defaultColor,
    this.spacingBetweenTitleAndSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final baseStyle = AppText.h4b!
        .s(titleFontSize ?? 24.sp)
        .copyWith(letterSpacing: 0, fontFamily: 'HankenGrotesk');

    final Color primary = highlightColor ?? AppTheme.of(context).primary.main!;
    final Color normal = defaultColor ?? AppTheme.of(context).text.shade800!;

    final Color firstColor = highlightPosition == HighlightPosition.first
        ? primary
        : normal;
    final Color secondColor = highlightPosition == HighlightPosition.second
        ? primary
        : normal;

    return Column(
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: baseStyle,
            children: [
              TextSpan(
                text: firstText,
                style: baseStyle.copyWith(color: firstColor),
              ),
              TextSpan(
                text: ' $secondText',
                style: baseStyle.copyWith(color: secondColor),
              ),
            ],
          ),
        ),
        Space.yf(spacingBetweenTitleAndSubtitle ?? 8),
        if (subtitle != null)
          Text(
            subtitle!,
            style: AppText.b2!.cl(AppTheme.of(context).text.main!),
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
          ),
        ?subtitleWidget,
      ],
    );
  }
}
