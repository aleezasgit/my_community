part of '../create_new_password.dart';

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
                title: 'Create New Password',
                subtitle: 'Choose a strong password for your account.',
              ),
              Space.yf(32),
              AppTextField(
                name: _FormKeys.newPassword,
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
              AppTextField(
                name: _FormKeys.confirmNewPassword,
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
              Space.yf(24),
              AppButton(
                label: 'Reset & Login',
                onPressed: () {
                  AppRoutes.login.pushReplace(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
