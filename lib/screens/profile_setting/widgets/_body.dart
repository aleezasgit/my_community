part of '../profile_settings.dart';


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.background.main,
      resizeToAvoidBottomInset: false,

      // ─── 1. Centered Top App Bar ───────────────────────────────────────────
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Profile Info',
        hasLeadingIcon: true,
        verticalPadding: 8,
      ),

      // ─── 2. Form Canvas Layout Tree ────────────────────────────────────────
      body: FormBuilder(
        key: state.formKey,
        initialValue: _FormData.initialValues(),
        child: Padding(
          padding: Space.hf(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.yf(16),

                      // Section Typography Header Titles
                      Text(
                        'Profile Info',
                        style: AppText.h3b,),

                        Space.yf(10),
                        Text(
                        'You can manage the basic info of your profile here',
                        style: AppText.b1?.cl(AppTheme.of(context).text.main!),),
                
                        //spacingBetweenTitleAndSubtitle: 6,
                      

                      Space.yf(32),

                      // ─── Avatar Modification Group with Floating Edit Badge ───
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: state.handleUpdateAvatar,
                              child: Stack(
                                children: [
                                  // Base Image Canvas Profile Mask
                                  Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      border: Border.all(
                                        width: 2,
                                        color: AppTheme.of(context).primary.shade300!
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/pngs/Frame 2147229685.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // Floating Inner Pen Editing Badge Overlay
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          color: theme.background.shade200!,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                       padding: Space.all(8),
                                        child: SvgPicture.asset(
                                          'assets/svgs/edit-2.svg',
                                       //   height: 20.h,
                                     //     width: 20.w, // Ensure you have this pen/edit icon asset
                                         
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Space.yf(10),
                            Text(
                              'Profile Photo',
                              style: AppText.b1b!.cl(theme.text.shade800!),
                            ),
                          ],
                        ),
                      ),

                      Space.yf(32),

                      // ─── Username Input Field ───
                      AppTextField(
                        name: _FormKeys.username,
                        type: TextFieldType.withIcon,
                        hint: 'Username',
                        textInputAction: TextInputAction.next,
                        prefixIcon: PrefixIcon(iconPath: 'assets/svgs/User.svg'),
                      ),

                      Space.yf(10),
                      

                      // ─── Phone Number Custom Row Input Field ───
                      // Merges country selection indicators directly onto the visual structure
                      AppTextField(
                        name: _FormKeys.phoneNumber,
                        type: TextFieldType.withIcon,
                      //  suffixIcon: "",
                        hint: 'Phone number',
                       // keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Space.xf(12)!,
                            // Small mock country flag representation block
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2.r),
                              child: Image.asset(
                                'assets/pngs/image 3.png', // Or wrap inside a dynamic selector path
                                width: 24.w,
                                height: 16.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Space.xf(4)!,
                            Text(
                              state.selectedCountryCode,
                              style: AppText.b1!.cl(theme.text.shade800!),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16.w,
                              color: theme.text.shade800,
                            ),
                            Space.xf(8)!,
                            // Vertical Divider Line block separating parameters
                            Container(
                              width: 1.w,
                              height: 20.h,
                              color: theme.lightGrey.main!.withOpacity(0.5),
                            ),
                            Space.xf(4)!,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ─── 3. Bottom Anchored Action Save Button ─────────────────────
              AppButton(
                label: 'Save Changes',
                buttonType: ButtonType.primary,
                onPressed: () => state.saveProfileInfo(context),
              ),
              
              Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}