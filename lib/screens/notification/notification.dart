import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';
import 'package:provider/provider.dart';
import 'package:my_community/configs/configs.dart';

import 'package:my_community/widgets/core/app_bar/app_bar.dart';

part 'widget/_body.dart';
part '_state.dart';
part 'data.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}