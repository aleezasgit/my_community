import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/router/routes.dart';
import 'package:my_community/screens/aleeza_widgets/news_section/news_card.dart';
import 'package:my_community/widgets/core/headers/user_header.dart';
import 'package:my_community/widgets/core/tab_bar/tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:my_community/configs/configs.dart';

// Import your custom widgets or packages if needed (e.g., flutter_svg)


part 'widget/_body.dart';
part '_state.dart';
part 'data.dart';
//part 'widgets/_news_article_card.dart'; // House your pre-made card component here

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}