part of 'news_details.dart';

class ArticleDetailData {
  final String title;
  final String imagePath;
  final String badgeText;
  final List<String> paragraphs;

  const ArticleDetailData({
    required this.title,
    required this.imagePath,
    required this.badgeText,
    required this.paragraphs,
  });
}

class RelatedArticleData {
  final String title;
  final String content;
  final String badgeText;
  final List<String> hashtags;

  const RelatedArticleData({
    required this.title,
    required this.content,
    required this.badgeText,
    required this.hashtags,
  });
}

const ArticleDetailData primaryArticle = ArticleDetailData(
  title: 'How AI is transforming the future of remote work worldwide',
  imagePath: 'assets/pngs/Frame 2147229685.png',
  badgeText: 'Top',
  paragraphs: [
    'Explore the dynamic realm of artificial intelligence revolutionizing online teamwork. From intelligent virtual helpers to advanced data insights, uncover innovations that are transforming efficiency and creativity in our digital world.',
    'Uncover the transformative power of artificial intelligence in enhancing remote collaboration. With tools ranging from AI-driven assistants to insightful analytics, learn how these advancements are redefining productivity and creative processes in the modern era.',
    'Delve into the innovative world of artificial intelligence that is reshaping virtual teamwork. Discover how smart tools and predictive technologies are enhancing both productivity and creativity in today\'s digital landscape.',
    'Investigate the cutting-edge advancements in artificial intelligence that are improving virtual collaboration. From AI assistants to data-driven insights, find out how these technologies are elevating productivity and sparking creativity in the digital age.',
    'Journey through the advancements in artificial intelligence that are enhancing online collaboration. From intelligent assistants to predictive analytics, discover the tools that are transforming productivity and creativity in our increasingly digital environment.',
  ],
);

const List<RelatedArticleData> relatedArticles = [
  RelatedArticleData(
    title: 'How AI is transforming the future of remote work worldwide',
    content: 'Dive into the evolving landscape of artificial intelligence enhancing virtual collaboration. From smart assistants to predictive analytics...',
    badgeText: 'Top',
    hashtags: ['AI', 'remotework', 'tech'],
  ),
  RelatedArticleData(
    title: 'How AI is transforming the future of remote work worldwide',
    content: 'Dive into the evolving landscape of artificial intelligence enhancing virtual collaboration. From smart assistants to predictive analytics...',
    badgeText: 'Top',
    hashtags: ['future', 'innovation'],
  ),
];