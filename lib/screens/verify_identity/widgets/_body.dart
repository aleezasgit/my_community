part of '../verify_identity.dart';

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
                title: 'Verify Your Identity',
                subtitle: 'Enter the OTP sent to your mobile number.',
              ),
              Space.yf(32),
              PinCodeField(
                length: 6,
                onCompleted: (code) {
                  debugPrint('OTP entered: $code');
                  // verify code...
                },
                onChanged: (code) => debugPrint('current: $code'),
              ),
              Space.yf(24),
              AppButton(
                label: 'Continue',
                onPressed: () {
                  AppRoutes.createNewPassword.push(context);
                },
              ),
              Space.yf(48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t get OTP? ',
                    style: AppText.b2?.copyWith(
                      color: AppTheme.of(context).text.main,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Resend OTP',
                      style: AppText.b2b?.copyWith(
                        color: AppTheme.of(context).text.shade800,
                        decoration: TextDecoration.underline,
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
