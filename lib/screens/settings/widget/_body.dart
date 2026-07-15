part of '../settings.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.background.main,

      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Settings',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      body: Padding(
        padding: Space.hf(20),
        child: Column(
          children: [
            Space.yf(16),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _buildSettingsGroup(context, mainSettings, state),
                    Space.yf(12),
                    _buildSettingsGroup(context, supportSettings, state),
                  ],
                ),
              ),
            ),

            Space.yf(16),

            AppButton(
              label: 'Delete Account',
              buttonType: ButtonType.primaryWithIconLeft,
              onPressed: () {},
              backgroundColor: AppTheme.of(context).background.shade200,
              iconPath: 'assets/svgs/delete.svg',
              textColor: AppTheme.of(context).text.main!,
            ),

            Space.yf(10),

            AppButton(
              label: 'Logout',
              buttonType: ButtonType.primaryWithIconLeft,
              onPressed: () {},
              backgroundColor: AppTheme.of(context).primary.main,
              iconPath: 'assets/svgs/logout.svg',
            ),

            Space.yf(32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(
    BuildContext context,
    List<Map<String, String>> items,
    _ScreenState state,
  ) {
    return Container(
      width: double.infinity,
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: AppTheme.of(context).background.shade200,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
         // final isLast = index == items.length - 1;

          return Column(
            children: [
              InkWell(
                onTap: () => state.handleSettingTap(context, item['id']!),
                // onTap: () => state.handleSettingTap(item['id']!),
                borderRadius: BorderRadius.circular(8.r),
                child: Padding(
                  padding: Space.vf(12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        item['icon']!,
                        width: 20.w,
                        height: 20.h,
                      ),
                      Space.xf(16),
                      Expanded(
                        child: Text(
                          item['label']!,
                          style: AppText.b1b!.cl(
                            AppTheme.of(context).text.shade800!,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/Alt Arrow Right.svg',
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Divider between rows, not after last
             
            ],
          );
        }),
      ),
    );
  }
}