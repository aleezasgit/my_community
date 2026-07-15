part of '../support.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Support',type: AppBarType.withTextCenter),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:Space.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //do i have to add space, alreday did padding, icon color and contact tile icon
           Space.yf(16),
        
            _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
            //  iconBgColor: AppTheme.of(context).background.shade200!,
              title: 'Email Address',
              subtitle: 'info@gmail.com',
              onTap: () {},
            ),
            Space.yf(10),
            _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
             // iconBgColor: AppTheme.of(context).background.shade200!,
              title: 'Phone number',
              subtitle: '00-123-456-789',
              onTap: () {},
            ),
            Space.yf(10),
            _SupportTile(
              iconPath: 'assets/svgs/global.svg',
            //  iconBgColor: AppTheme.of(context).background.shade200!,
              title: 'Website',
              subtitle: 'assets/svgs/global.svg',
              onTap: () {},
            ),
            Space.yf(10),
               _SupportTile(
              iconPath: 'assets/svgs/sms.svg',
             // iconBgColor: AppTheme.of(context).background.shade200!,
              title: 'Contact',
              subtitle: 'info@gmail.com',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Support Tile
// ─────────────────────────────────────────────────────────────────────────────

