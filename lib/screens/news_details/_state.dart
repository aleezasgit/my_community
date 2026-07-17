part of 'news_details.dart';

class NewsDetailScreenState extends ChangeNotifier {
  final BuildContext context;
  final ArticleDetailData article = primaryArticle;
  final List<RelatedArticleData> recommendations = relatedArticles;

  NewsDetailScreenState(this.context);

  void navigateToArticle(RelatedArticleData selectedArticle) {
    // Implement deeper screen navigation transitions here
    notifyListeners();
  }
}