part of '../forgot_password.dart';

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
              AppHeadings(
                title: 'Forgot Password',
                subtitle:
                    'Enter your mobile number to receive a 6-digit verification code.',
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
              Space.yf(24),
              AppButton(
                label: 'Send OTP',
                onPressed: () {
                  AppRoutes.verifyIdentity.push(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
