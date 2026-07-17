part of 'news_details.dart';
class NewsDetailView extends StatelessWidget {
  final String title;
  final List<String> paragraphs;
  final String imagePath;
  final String badgeText;

  const NewsDetailView({
    super.key,
    required this.title,
    required this.paragraphs,
    required this.imagePath,
    this.badgeText = 'Top',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Top Display Area: Hero Picture Banner ───
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 177.h,
                fit: BoxFit.cover,
              ),
            ),
            
            // Overlay Badge Positioned Frame (Safe clearance below the app bar)
            Positioned(
              top: 12.h,
              left: 8.w, // Shifts label right to clear the back arrow action zone
              child: Container(
              padding: Space.all(12,6),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).background.main!,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  badgeText,
                  style: AppText.l1bm!.cl(AppTheme.of(context).text.shade800!),
                ),
              ),
            ),
          ],
        ),
        Space.yf(10),

        // ─── Article Details Body Content ───
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Article Header Heading Text
            Text(
              title,
              style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!),
                   
                  
            ),
        
            Space.yf(10),
        
            // Renders your customizable paragraph body items sequentially
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paragraphs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: Space.only(bottom: 10),
                  child: Text(
                    paragraphs[index],
                    style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                      
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

  final mockParagraphs = [
      'Explore the dynamic realm of artificial intelligence revolutionizing online teamwork. From intelligent virtual helpers to advanced data insights, uncover innovations that are transforming efficiency and creativity in our digital world.',
      'Uncover the transformative power of artificial intelligence in enhancing remote collaboration. With tools ranging from AI-driven assistants to insightful analytics, learn how these advancements are redefining productivity and creative processes in the modern era.',
      'Delve into the innovative world of artificial intelligence that is reshaping virtual teamwork. Discover how smart tools and predictive technologies are enhancing both productivity and creativity in today\'s digital landscape.',
      'Investigate the cutting-edge advancements in artificial intelligence that are improving virtual collaboration. From AI assistants to data-driven insights, find out how these technologies are elevating productivity and sparking creativity in the digital age.',
      'Journey through the advancements in artificial intelligence that are enhancing online collaboration. From intelligent assistants to predictive analytics, discover the tools that are transforming productivity and creativity in our increasingly digital environment.',
    ];