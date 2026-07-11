part of '../login.dart';

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
              AppTextLogo(size: 36),
              Space.yf(32),
              TwoColorHeading(
                firstText: 'Welcome Back',
                secondText: 'Yazan',
                subtitle: 'Enter your credentials to continue.',
              ),
              Space.yf(32),
              FormBuilderPhoneCodeField(
                name: _FormKeys.phoneNumber,
                countries: kCountryCodes,
                initialCountry: kCountryCodes.first,
                // validator: PhoneValidators.compose([
                //   PhoneValidators.required(),
                //   PhoneValidators.numeric(),
                //   PhoneValidators.minLength(7),
                //   PhoneValidators.maxLength(15),
                // ]),
              ),
              Space.yf(10),
              AppTextField(
                name: _FormKeys.password,
                isPass: true,
                type: TextFieldType.withIcon,
                hint: 'Password',

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
              Space.yf(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRoutes.forgotPassword.push(context);
                    },
                    child: Text(
                      'Forget Password?',
                      style: AppText.b2b!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Space.yf(24),
              AppButton(
                label: 'Login',
                onPressed: () {
                  AppRoutes.settingsAndLanguage.push(context);
                },
              ),
              48.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: AppText.b2?.copyWith(
                      color: AppTheme.of(context).text.main,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AppRoutes.TestingScreen.push(context),
                    child: Text(
                      'Sign Up',
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
