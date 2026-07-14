import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_community/widgets/core/app_bar/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:my_community/configs/configs.dart';



part 'widgets/_body.dart';
part 'state.dart';
part 'data.dart';

class ShareProfileScreen extends StatelessWidget {
  const ShareProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}