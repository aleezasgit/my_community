import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/widgets/core/app_bar/app_bar.dart';
import 'package:my_community/widgets/core/headers/app_header.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';
import 'package:my_community/widgets/design/phone_number/country_code.dart';
import 'package:my_community/widgets/design/phone_number/phone_code_field.dart';

import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

