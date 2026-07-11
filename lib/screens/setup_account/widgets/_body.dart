part of '../setup_account.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),

      body: FormBuilder(
        key: state.formKey,
        initialValue: _FormData.initialValues(),
        child: SingleChildScrollView(
          padding: Space.hf(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),
              AppHeadings(
                title: 'Set Up Your Account',
                subtitle: 'Choose a username and password to continue.',
              ),
              Space.yf(32),
              AppTextField(
                name: _FormKeys.userName,
                type: TextFieldType.withIcon,
                hint: 'Username',
                textInputAction: TextInputAction.next,
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(errorText: 'Email is required'),
                //   FormBuilderValidators.email(errorText: 'Enter a valid email'),
                // ]),
                prefixIcon: PrefixIcon(iconPath: 'assets/svgs/user-square.svg'),
              ),
              Space.yf(10),
              AppTextField(
                name: _FormKeys.password,
                type: TextFieldType.withIcon,
                hint: 'Set Password',
                isPass: true,
                textInputAction: TextInputAction.next,
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(errorText: 'Email is required'),
                //   FormBuilderValidators.email(errorText: 'Enter a valid email'),
                // ]),
                prefixIcon: PrefixIcon(iconPath: 'assets/svgs/lock.svg'),
              ),
              Space.yf(10),
              AppTextField(
                name: _FormKeys.confirmPassword,
                isPass: true,
                type: TextFieldType.withIcon,
                hint: 'Confirm Password',

                textInputAction: TextInputAction.done,
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(
                //     errorText: 'Password is required',
                //   ),
                //   FormBuilderValidators.minLength(
                //     6,
                //     errorText: 'Minimum length is 6 characters',
                //   ),
                // ]),
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/confirm_lock.svg',
                ),
              ),
              Space.yf(24),
              AppButton(label: 'Continue', onPressed: () {}),
              Space.yf(48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppText.b2?.copyWith(
                      color: AppTheme.of(context).text.main,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRoutes.login.pushReplace(context);
                    },
                    child: Text(
                      'Sign In',
                      style: AppText.b2b?.copyWith(
                        color: AppTheme.of(context).text.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
