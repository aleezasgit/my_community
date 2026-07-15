part of '../support.dart';
class _SupportTile extends StatelessWidget {
  final String iconPath;
  //final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportTile({
    required this.iconPath,
   // required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(12,16),
        decoration: BoxDecoration(
          color: AppTheme.of(context).background.shade200,
          borderRadius: BorderRadius.circular(16.r),
       
        ),
        child: Row(
          children: [
            Container(
             // padding: Space.all(8),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppTheme.of(context).background.main,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24.w,
                  height: 24.h,
               
                ),
              ),
            ),
            Space.xf(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.b1b),
                Space.yf(2),
                Text(
                  subtitle,
                  style: AppText.b1?.w(4).cl(AppTheme.of(context).text.main!),
                ),
              ],
            ),
            Spacer(),
               SvgPicture.asset(
                 'assets/svgs/Arrow Right.svg',
                 width: 18.w,
                 height: 18.h,
               ),
          ],

       
        ),
      ),
    );
  }
}