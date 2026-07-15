part of '../security_settings.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      // Prevents keyboard scaling from pushing elements around awkwardly
      resizeToAvoidBottomInset: false,

      // ─── 1. Centered Top App Bar ───────────────────────────────────────────
      appBar: CustomAppBar(
        type: AppBarType.withTextCenter,
        title: 'Security Settings',
        hasLeadingIcon: true,
       // verticalPadding: 12,
      ),

      // ─── 2. Form Canvas & Layout Tree ──────────────────────────────────────
      body: FormBuilder(
        key: state.formKey,
        initialValue: _FormData.initialValues(),
        child: Padding(
          padding: Space.hf(16),
          child: Column(
            children: [
              // Expandable interactive scroll container for fields
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.yf(16),

                      // Input 1: Old Password Field
                      AppTextField(
                        name: _FormKeys.oldPassword,
                        type: TextFieldType.withIcon,
                        hint: 'Old Password',
                        isPass: true,
                        textInputAction: TextInputAction.next,
                        prefixIcon: PrefixIcon(iconPath: 'assets/svgs/lock.svg'),
                      ),
                      
                      Space.yf(10),

                      // Input 2: New Password Field
                      AppTextField(
                        name: _FormKeys.newPassword,
                        type: TextFieldType.withIcon,
                        hint: 'New Password',
                        isPass: true,
                        textInputAction: TextInputAction.next,
                        prefixIcon: PrefixIcon(iconPath: 'assets/svgs/lock.svg'),
                      ),

                      Space.yf(10),

                      // Input 3: Confirm New Password Field
                      AppTextField(
                        name: _FormKeys.confirmNewPassword,
                        type: TextFieldType.withIcon,
                        hint: 'Confirm New Password',
                        isPass: true,
                        textInputAction: TextInputAction.done,
                        prefixIcon: PrefixIcon(iconPath: 'assets/svgs/confirm_lock.svg'),
                      ),
                      
                      Space.yf(24),
                    ],
                  ),
                ),
              ),

              // ─── 3. Bottom Anchored Save Action Button ────────────────────
              AppButton(
                label: 'Save Changes',
                buttonType: ButtonType.primary, // Using standard primary type to guarantee no missing token crashes
                onPressed: () => state.saveSecurityChanges(context),
              ),
              
              Space.yf(32), // Safe area bottom spacer
            ],
          ),
        ),
      ),
    );
  }
}