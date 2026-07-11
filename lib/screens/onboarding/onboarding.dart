import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/l10n/app_localizations.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/widgets/app_text_logo.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';

part 'widgets/_body.dart';
part 'data.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const _Body();
  }
}

