import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/statics/app_statics.dart';

class BottomsheetHeader extends StatelessWidget {
  final String? title;
  final bool hasBackAction;
  final VoidCallback? onBackPressed;
  final bool isTextCentered;
  final bool showNotch;

  const BottomsheetHeader({
    super.key,
    this.title,
    this.hasBackAction = true,
    this.onBackPressed,
    this.isTextCentered = false,
    this.showNotch = true,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final header = isTextCentered
        ? _buildCentered(context)
        : _buildRow(context);

    if (!showNotch) return header;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [const _Notch(), Space.yf(6), header],
    );
  }

  Widget _buildCentered(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (title != null)
          Text(title!, style: AppText.b1b!.copyWith(height: 1.0)),
        if (hasBackAction)
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onBackPressed ?? () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppStaticData.backArrow,
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: hasBackAction
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: [
        if (hasBackAction) ...[
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppStaticData.backArrow,
              width: 20.w,
              height: 20.h,
            ),
          ),
          Space.xf(10),
        ],
        if (title != null)
          Expanded(
            child: Text(
              title!,
              style: AppText.h6bm!.copyWith(
                height: 1.0,
                fontFamily: 'HankenGrotesk',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}

class _Notch extends StatelessWidget {
  const _Notch();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppTheme.of(context).background.shade200, //  your token
        borderRadius: BorderRadius.circular(100.r),
      ),
    );
  }
}
