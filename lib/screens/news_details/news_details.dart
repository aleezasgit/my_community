import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/screens/aleeza_widgets/news_section/articles.dart';
import 'package:provider/provider.dart';
import 'package:my_community/configs/configs.dart';
// Importing your exact NewsTextArticleCard widget from your project:


part 'widget/_body.dart';
part '_state.dart';
part 'data.dart';
part 'news_article.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsDetailScreenState(context),
      child: Consumer<NewsDetailScreenState>(
        builder: (context, state, _) => NewsDetailBody(state: state),
      ),
    );
  }
}