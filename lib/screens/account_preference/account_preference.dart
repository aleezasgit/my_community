import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/configs/configs.dart';
import 'package:my_community/screens/aleeza_widgets/pick_interests.dart';
import 'package:my_community/screens/aleeza_widgets/tell_us_about.dart';
import 'package:my_community/widgets/core/app_bar/app_bar.dart';
import 'package:my_community/widgets/core/headers/app_header.dart';
import 'package:my_community/widgets/core/tab_bar/tab_bar.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';


part 'widget/_body.dart';
part '_state.dart';

class AccountPreferencesScreen extends StatefulWidget {
  const AccountPreferencesScreen({super.key});

  @override
  State<AccountPreferencesScreen> createState() => _AccountPreferencesScreenState();
}