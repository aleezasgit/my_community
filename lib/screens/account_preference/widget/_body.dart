part of '../account_preference.dart';

class _AccountPreferencesBody extends StatelessWidget {
  final _AccountPreferencesScreenState state;

  const _AccountPreferencesBody(this.state);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: CustomAppBar(
        title: 'Account Preferences',
      //  appBarType: AppBarType.backWithTitle,
       // onLeadingPressed: () => Navigator.of(context).maybePop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: Space.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─── 1. Top Segmented Switch Tab Bar ─────────────────────
                    AppSwitchTabBar(
                      tabs: state.preferenceTab,
                      selectedIndex: state.selectedTabIndex,
                      onChanged: (index) => state.setTabIndex(index),
                      variant: AppTabVariant.text,
                      expanded: true,
                      selectedColor: AppTheme.of(context).primary.main,
                    ),

                    Space.yf(24),

                    // ─── 2. Conditional Dynamic Tab Content ───────────────────
                    if (state.selectedTabIndex == 0) ...[
                      // Gender Selection Tab
                  Text(
                        'Tell Us About Yourself',
                        style: AppText.h3b?.cl(AppTheme.of(context).text.shade800!)!
                        // cl(AppTheme.of(context).background.shade800!),
                      ),
                      Space.yf(10),
                      Text(
                        'Select the gender you identify with to help us personalize your experience.',
                        style: AppText.b2!.cl(AppTheme.of(context).text.main!)
                        // .cl(AppTheme.of(context).accent.main!),
                      ),
                      Space.yf(32),

                      FormBuilder(
                        key: state.formKey,
                        child: const GenderFormBuilderField(
                          name: 'gender_selection',
                          initialValue: 0,
                        ),
                      ),
                    ] 
                    else if (state.selectedTabIndex == 1) ...[
                      // Age Selection Tab Placeholder/Form
                  Text(
                        'Enter Your Date Of Birth',
                        style: AppText.h3b!.cl(AppTheme.of(context).text.shade800!),
                      ),
                      Space.yf(10),
                      Text(
                        "Select topics you'd like to see more of.",
                        style: AppText.b2!.cl(AppTheme.of(context).text.main!)
                      ),
                      Space.yf(32),

                      // Replace with your custom Age picker/FormBuilder widget
                      Center(
                        child: Text(
                          'Age Selector Content',
                          style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
                        ),
                      ),
                    ] 
                    else if (state.selectedTabIndex == 2) ...[
                      // Interests Selection Tab Placeholder/Form
                  Text(
                        'Pick Your Interests',
                        style: AppText.h3b!.cl(AppTheme.of(context).text.shade800!),
                      ),
                      Space.yf(10),
                      Text(
                        "Select topics you'd like to see more of.",
                        style: AppText.b2!.cl(AppTheme.of(context).text.main!),
                      ),
                      Space.yf(32),

                      FormBuilder(
                        key: state.formKey,
                        child: InterestsFormBuilderField(
                          name: 'interests_selection',
                          initialValue: const ['Technology', 'Food', 'Accessories'],
                        ),
                      ),
                    ]
                    else ...[
                      // Fallback View
                      SizedBox(
                        height: 200.h,
                        child: Center(
                          child: Text(
                            'No content available',
                            style: AppText.b2!.cl(AppTheme.of(context).text.main!),
                          ),
                        ),
                      ),
                    ],

                    Space.yf(32),
                  ],
                ),
              ),
            ),

            // ─── 3. Fixed Bottom Save Button ──────────────────────────────
            Padding(
              padding: Space.all(16),
              child: AppButton(
                label: 'Save Changes',
                //uttonType: ButtonType.solid,
                backgroundColor:
                    AppTheme.of(context).primary.main,
                textColor: Colors.white,
                onPressed: state.onSaveChanges,
              ),
            ),
          ],
        ),
      ),
    );
  }
}