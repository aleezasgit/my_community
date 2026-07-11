part of '../create_account.dart';

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
        child: Padding(
          padding: Space.hf(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),
              AppTextLogo(size: 36.h),
              Space.yf(32),
              AppHeadings(
                title: 'Create New Account 🔥',
                subtitle: 'Please fill form to create new account.',
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
              24.verticalSpace,
              AppButton(
                label: 'Continue to Verify',
                onPressed: () {
                  AppRoutes.verifyMobileNumber.push(context);
                },
              ),
              48.verticalSpace,
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
                    onTap: () => AppRoutes.login.push(context),
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
