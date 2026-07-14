import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';



enum AppTabVariant { text, iconText }


class AppTab {
  final String label;
  final String? iconPath;

  const AppTab({required this.label, this.iconPath});
}

 
class AppSwitchTabBar extends StatelessWidget {
  final List<AppTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  /// Defaults to [AppTabVariant.text] (the primary variant).
  final AppTabVariant variant;

  final bool expanded;

  // Optional style overrides — sensible theme defaults are used otherwise.
  final Color? selectedColor;
  final Color? backgroundColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? borderColor;
  final double? height;
  final double? iconSize;

  const AppSwitchTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    this.variant = AppTabVariant.text,
    this.expanded = true,
    this.selectedColor,
    this.backgroundColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderColor,
    this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final theme = AppTheme.of(context);

    final selectedFill = selectedColor ?? theme.primary.main;

    final row = Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        for (int i = 0; i < tabs.length; i++)
          if (expanded)
            Expanded(child: _buildTab(context, i, selectedFill!))
          else
            Padding(
              padding: EdgeInsets.only(right: i == tabs.length - 1 ? 0 : 4.w),
              child: _buildTab(context, i, selectedFill!),
            ),
      ],
    );

    return Container(
      height: height,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppTheme.of(context).background.shade200,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: borderColor ?? theme.lightGrey.main!,
          width: 1.w,
        ),
      ),
      child: expanded
          ? row
          : SingleChildScrollView(scrollDirection: Axis.horizontal, child: row),
    );
  }

  Widget _buildTab(BuildContext context, int index, Color selectedFill) {
    final theme = AppTheme.of(context);
    final isSelected = index == selectedIndex;
    final tab = tabs[index];

    final fg = isSelected
        ? (selectedTextColor ?? theme.white!)
        : (unselectedTextColor ?? theme.text.shade800!);

    final showIcon = variant == AppTabVariant.iconText && tab.iconPath != null;

    return GestureDetector(
      onTap: () => onChanged(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.w : 10.w,
          vertical: 9.5.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? selectedFill : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon) ...[
              SvgPicture.asset(
                tab.iconPath!,
                width: iconSize ?? 20.w,
                height: iconSize ?? 20.w,
                colorFilter: ColorFilter.mode(fg, BlendMode.srcIn),
              ),
              Space.xf(8),
            ],
            Flexible(
              child: Text(
                tab.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.l1!.cl(fg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}