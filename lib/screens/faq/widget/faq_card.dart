
part of '../faq.dart';
class _FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FaqCard({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: UIProps.duration,
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: Space.all(12,isExpanded?12:14),
        decoration: BoxDecoration(
          color: AppTheme.of(context).background.shade100,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Question row ─────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(question, style: AppText.b1b?.w(7)),
                ),
                Space.xf(22),
                AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0.00,
                  duration: UIProps.duration,
                  curve: Curves.easeInOut,
                  child: SvgPicture.asset(
                   'assets/svgs/Alt Arrow Down.svg',
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),

      // 

            // ─── Answer (animated expand) ─────────────────────────
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Space.yf(12),
                      Container(
              width: double.infinity,
              height: 1.h,
              color: AppTheme.of(context).primary.shade300,
            ),
                  Space.yf(8),
                  Text(
                    answer,
                    style: AppText.b1?.w(4).cl(AppTheme.of(context).text.main!),
                  ),
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: UIProps.duration,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}