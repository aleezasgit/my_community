import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/screens/aleeza_widgets/community_widget/member.dart';

import 'package:my_community/screens/aleeza_widgets/friends/single_video.dart';
import 'package:my_community/screens/aleeza_widgets/friends/yourown_post_multiple_photo.dart';
import 'package:my_community/screens/profile/events.dart';
import 'package:my_community/screens/profile/my_friends.dart';
import 'package:my_community/screens/profile/requests.dart';

import 'package:my_community/widgets/core/app_bar/app_bar.dart';
import 'package:my_community/widgets/core/tab_bar/tab_bar.dart';
import 'package:my_community/widgets/design/buttons/app_button/app_button.dart';
import 'package:my_community/widgets/design/textfields/search_textfield/search_field.dart';

import 'package:provider/provider.dart';
import 'package:my_community/configs/configs.dart';


part 'widgets/_body.dart';
part 'state.dart';
part 'data.dart';

class UserFeedProfileScreen extends StatelessWidget {
  const UserFeedProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}