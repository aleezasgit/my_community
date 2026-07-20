import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/configs/configs.dart';

class MarketCard extends StatelessWidget {
  final String sellerName;
  final String sellerAvatarPath;
  final String itemImagePath;
  final String itemTitle;
  final String price;
  final String currency;
  final String tagLabel;
  final bool isFavorite;
  final bool isForSale;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onCardTap;

  const MarketCard({
    super.key,
    required this.sellerName,
    required this.sellerAvatarPath,
    required this.itemImagePath,
    required this.itemTitle,
    required this.price,
    this.currency = 'SAR',
    this.tagLabel = 'For Sale',
    this.isFavorite = false,
    this.isForSale= false,
    this.onFavoriteTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBg = AppTheme.of(context).background.shade200!;

    return GestureDetector(
      onTap: onCardTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
       // width: 172.w,
        padding: Space.all(10),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─── Header: Seller Info ─────────────────────────────────────
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    sellerAvatarPath,
                    width: 28.w,
                    height: 28.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Space.xf(10),
                Expanded(
                  child: Text(
                    sellerName,
                    style: AppText.b2bm!.cl(AppTheme.of(context).text.shade800!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            Space.yf(16),

            // ─── Product Image Stack (Tag & Favorite Icon Overlay) ────────
            Stack(
              children: [
                Container(
                  width: double.infinity,
                //  height: 140.h,
                  padding: Space.vf(16),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).background.main,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      itemImagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Top-Left Status Tag
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                  padding: Space.all(10,5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      tagLabel,
                      style: 
                      isForSale? AppText.l1b!.cl(AppTheme.of(context).accent.main!):AppText.l1b!.cl(AppTheme.of(context).primary.main!)
                    ),
                  ),
                ),

                // Top-Right Favorite Heart Icon
                Positioned(
                  top: 20.h,
                  right: 20.w,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      isFavorite ? "assets/svgs/heart.svg" : "assets/svgs/Iconly.svg",
                                        
                    ),
                  ),
                ),
              ],
            ),

            Space.yf(12),

            // ─── Product Title & Price ────────────────────────────────────
            Text(
              itemTitle,
              style: AppText.b2bm!.cl(AppTheme.of(context).text.shade800!),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Space.yf(4),
            Text(
              '$price $currency',
              style: AppText.l1b!.cl(AppTheme.of(context).accent.main!),
            ),
          ],
        ),
      ),
    );
  }
}